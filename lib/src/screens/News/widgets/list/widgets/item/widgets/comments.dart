import "package:flutter/material.dart";

class Comments extends StatelessWidget {
  final int descendants;
  Comments({this.descendants});

  Widget build(BuildContext ctx) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 8),
          Icon(Icons.comment),
          SizedBox(height: 5),
          Text(
            "$descendants",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            )
          )
        ],
      ),
    );
  }
}