import "package:flutter/material.dart";

import "widgets/list/index.dart";

class News extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News",
          style: TextStyle(
            wordSpacing: 4,
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
          ),
        )
      ),
      body: Container(
        child: ItemListContainer(),
        color: Colors.grey[100],
      ),
    );
  }
}