import "package:flutter/material.dart";
import "package:hacker_news/src/models/item.dart";

import "widgets/index.dart";

class Item extends StatelessWidget {
  final ItemModel itemModel;
  Item({this.itemModel});

  Widget build(BuildContext ctx) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                ctx, 
                "/details",
                arguments: itemModel.id
              );
            },
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10
            ),
            leading: Vote(score: itemModel.score),
            title: Info(itemModel: itemModel),
            trailing: Comments(descendants: itemModel.descendants),
          ),
        ),
        Divider()
      ],
    );
  }
}