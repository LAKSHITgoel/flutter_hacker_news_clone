import "package:hacker_news/src/models/index.dart";
import "dart:async";

import "provider/index.dart";
import "abstract/index.dart";

class Repository {
  List<Source> sources = <Source>[
    dbProvider,
    newsApiProvider
  ];

  List<Cache> caches = <Cache>[
    dbProvider,
  ];

  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    
    for(Source source in sources) {
      item = await source.fetchItem(id);
      if (item != null) break;
    }

    for (Cache cache in caches) {
      cache.addItem(item);
    }
    return item;
  }

  clearCache() async {
    for (Cache cache in caches) {
      await cache.clear();
    }
  }
}