import "package:flutter/material.dart";
import "package:hacker_news/src/models/index.dart";
import "package:hacker_news/src/provider/stories/stories_provider.dart";
import "package:hacker_news/src/common/stories_loading_indicator.dart";
import "item.dart";

class ItemContainer extends StatelessWidget {
  final int itemId;
  ItemContainer({this.itemId});

  Widget build(BuildContext ctx) {
    final bloc = StoriesProvider.of(ctx);
    
    return StreamBuilder(
      stream: bloc.itemsOutput,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if(!snapshot.hasData) {
          return StoriesLoadingIndicator();
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (itemSnapshot.hasData) {
              return Item(itemModel: itemSnapshot.data);
            }
            return StoriesLoadingIndicator();
          }
        );
      }
    );
  }
}