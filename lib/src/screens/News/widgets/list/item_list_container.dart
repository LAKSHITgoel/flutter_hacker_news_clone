import "package:flutter/material.dart";

import "package:hacker_news/src/provider/stories/stories_provider.dart";
import "item_list.dart";

class ItemListContainer extends StatelessWidget {
  
  Widget build(BuildContext ctx) {
    final bloc = StoriesProvider.of(ctx);

    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (snapshot.hasData) {
          return ItemList(asyncSnapshot: snapshot);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}