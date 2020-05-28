import "package:flutter/material.dart";
import "package:hacker_news/src/provider/stories/stories_provider.dart";
import "widgets/item/index.dart";

class ItemList extends StatelessWidget {
  final AsyncSnapshot<List<int>> asyncSnapshot;

  ItemList({this.asyncSnapshot});

  Widget build(BuildContext ctx) {
  final bloc = StoriesProvider.of(ctx);
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: asyncSnapshot.data.length,
        itemBuilder: (context, int index) {
          print(index);
          bloc.fetchItem(asyncSnapshot.data[index]);
          return ItemContainer(itemId: asyncSnapshot.data[index]);
        },
      ),
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      }
    );
  }
}