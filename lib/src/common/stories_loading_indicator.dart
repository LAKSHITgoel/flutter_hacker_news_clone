import "package:flutter/material.dart";

class StoriesLoadingIndicator extends StatelessWidget {
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
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.orange
                ),
              ),
              padding: EdgeInsets.all(5),              
              height: 50,
              width: 50
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
            trailing: Container(
              height: 50,
              width: 50,
              color: Colors.grey[300]
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}