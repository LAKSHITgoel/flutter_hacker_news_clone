import "package:flutter/material.dart";

import "widgets/details_list/index.dart";

class Details extends StatelessWidget {
  final int id;
  Details({this.id});
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Story",
          style: TextStyle(
            wordSpacing: 4,
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
          ),
        )
      ),
      body: DetailsListContainer(id: id)
    );
  }
}