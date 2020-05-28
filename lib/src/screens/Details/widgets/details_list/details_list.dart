import "package:flutter/material.dart";
import "package:hacker_news/src/models/item.dart";
import "widgets/header/index.dart";
import "widgets/comment/index.dart";

class DetailsList extends StatelessWidget {
  final ItemModel itemModel;
  final Map<int, Future<ItemModel>> futureCacheMap;
  
  DetailsList({this.itemModel, this.futureCacheMap});

  Widget build(BuildContext ctx) {
    final children = <Widget>[
      HeaderContainer(id: itemModel.id),
    ];
    final List<CommentContainer> commentList = itemModel.kids.map((kidId) {
      return CommentContainer(
        id: kidId,
        futureCacheMap: futureCacheMap,
        depth: 0
      );
    }).toList();
    children.addAll(commentList);

    return ListView(
      children: children,
    );
  }
}