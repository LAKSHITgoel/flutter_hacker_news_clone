import "package:flutter/material.dart";

class CommentLoadingIndicator extends StatelessWidget {
  Widget build(BuildContext ctx) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 200,
                  color: Colors.grey[300]
                ),
                Container(
                  height: 20,
                  width: 100,
                  color: Colors.grey[300]
                )
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}