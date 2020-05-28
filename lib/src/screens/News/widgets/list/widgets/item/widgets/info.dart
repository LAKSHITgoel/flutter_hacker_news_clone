import "package:flutter/material.dart";
import "package:hacker_news/src/models/item.dart";

class Info extends StatelessWidget {
  final ItemModel itemModel;

  Info({this.itemModel});

  Widget build(BuildContext ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          itemModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14
          )
        ),
        Text(
          "by -${itemModel.by}",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontStyle: FontStyle.italic,
          )
        ),
      ]
    );
  }
}