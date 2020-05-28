import "package:rxdart/rxdart.dart";
import "package:hacker_news/src/models/index.dart";
import "package:hacker_news/src/resources/index.dart";

class DetailsBloc {
  final _repository = Repository();
  final _detailsFetcher = PublishSubject<int>();
  final _detailsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _topIds = PublishSubject<List<int>>();

  // Getters to Streams
  Stream<Map<int, Future<ItemModel>>> get itemWithDetailsOutput => _detailsOutput.stream;

  // Getters to Sinks
  Function(int) get fetchItemWithDetails => _detailsFetcher.sink.add;

  DetailsBloc() {
    _detailsFetcher.stream.transform(_detailsTransformer()).pipe(_detailsOutput);
  }

  clearCache() async {
    return await _repository.clearCache();
  }

  _detailsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
      (cache, int id, index) {
        print("de $index");
        cache[id] = _repository.fetchItem(id);
        cache[id].then((ItemModel item) {
          item.kids.forEach((kidId) {
            fetchItemWithDetails(kidId);
          });
        });
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _detailsFetcher.close();
    _detailsOutput.close();
  }
}