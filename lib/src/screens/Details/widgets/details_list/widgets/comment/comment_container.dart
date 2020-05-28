import "package:flutter/material.dart";
import "package:hacker_news/src/models/index.dart";
import "package:hacker_news/src/common/comment_loading_indicator.dart";
import "comment.dart";

class CommentContainer extends StatelessWidget {
  final int id;
  final int depth;
  final Map<int, Future<ItemModel>> futureCacheMap;

  CommentContainer({this.id, this.futureCacheMap, this.depth});

  Widget build(BuildContext ctx) {
    return FutureBuilder(
      future: futureCacheMap[id],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        final item = snapshot.data;
        if (!snapshot.hasData) {
          return CommentLoadingIndicator();
        }
        final children = <Widget>[
          Comment(
            title: item.text,
            author: item.by,
            depth: depth
          ),
          Divider()
        ];
        item.kids.forEach((kidId) {
          children.add(CommentContainer(
            id: kidId,
            futureCacheMap: futureCacheMap,
            depth: depth + 1,
          ));
        });
        return Column(
          children: children
        );
      },
    );
  }
}