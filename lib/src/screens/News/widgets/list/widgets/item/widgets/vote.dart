import "package:flutter/material.dart";

class Vote extends StatelessWidget {
  final int score;

  Vote({this.score});

  Widget build(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.orange
        ),
      ),
      padding: EdgeInsets.all(5),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$score",
            style: TextStyle(
              fontSize: 16,
              color: Colors.orange,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "votes",
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey[600]
            ),
          )
        ],
      ),
    );
  }
}