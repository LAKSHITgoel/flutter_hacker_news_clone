import "package:flutter/material.dart";
import "stories_bloc.dart";

export "stories_bloc.dart";

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  updateShouldNotify(_) => true;

  StoriesProvider({Key key, Widget child})
    : bloc = StoriesBloc(),
    super(key: key, child: child);

  static StoriesBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StoriesProvider>()).bloc;
  }
}