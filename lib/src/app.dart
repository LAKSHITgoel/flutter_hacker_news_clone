import "package:flutter/material.dart";

import "provider/stories/stories_provider.dart";
import "provider/details/details_provider.dart";
import "package:hacker_news/src/navigation/route_navigator.dart";

class App extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return DetailsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Hacker News",
          theme: ThemeData(
            primarySwatch: Colors.orange
          ),
          onGenerateRoute: (RouteSettings settings) {
            return RouteNavigator.routeNavigator(settings);
          },
        ),
      ),
    );
  }
}