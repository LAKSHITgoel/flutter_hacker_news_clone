import "package:flutter/material.dart";
import "package:hacker_news/src/models/item.dart";
import "package:hacker_news/src/provider/details/details_provider.dart";
import "package:hacker_news/src/common/comment_loading_indicator.dart";
import "header.dart";

class HeaderContainer extends StatelessWidget {
  final int id;
  HeaderContainer({this.id});
  
  Widget build(BuildContext ctx) {
    final DetailsBloc bloc = DetailsProvider.of(ctx);
    return StreamBuilder(
      stream: bloc.itemWithDetailsOutput,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return CommentLoadingIndicator();
        }
        return FutureBuilder(
          future: snapshot.data[id],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (itemSnapshot.hasData) {
              return Header(title: itemSnapshot.data.title);
            }
            return CommentLoadingIndicator();
          }
        );
      },
    );
  }
}