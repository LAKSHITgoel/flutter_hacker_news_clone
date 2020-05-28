import "package:flutter/material.dart";
import "package:hacker_news/src/screens/index.dart";
import "package:hacker_news/src/provider/stories/stories_provider.dart";
import "package:hacker_news/src/provider/details/details_provider.dart";


class RouteNavigator {
  
  static Route routeNavigator(RouteSettings settings) {
    switch(settings.name) {
      case "/" : {
        return MaterialPageRoute(
          builder: (ctx) {
            final bloc = StoriesProvider.of(ctx);
            bloc.fetchTopIds();
            return News();
          }
        );
      }

      case "/details": {
        int id = settings.arguments;
        return MaterialPageRoute(
          builder: (ctx) {
            final bloc = DetailsProvider.of(ctx);
            bloc.fetchItemWithDetails(id);
            return Details(id: id);
          }
        );
      }
      default: {
        return MaterialPageRoute(
          builder: (ctx) {
            return News();
          }
        );
      }
    }

  }


}