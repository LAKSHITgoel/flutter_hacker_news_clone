import "package:flutter/material.dart";
import "details_bloc.dart";

export "details_bloc.dart";

class DetailsProvider extends InheritedWidget {
  final DetailsBloc bloc;

  updateShouldNotify(_) => true;

  DetailsProvider({Key key, Widget child})
    : bloc = DetailsBloc(),
    super(key: key, child: child);

  static DetailsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<DetailsProvider>()).bloc;
  }
}