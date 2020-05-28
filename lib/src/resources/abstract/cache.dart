import "package:hacker_news/src/models/item.dart";

abstract class Cache {
  Future<int> addItem(ItemModel item);

  Future<int> clear();
}