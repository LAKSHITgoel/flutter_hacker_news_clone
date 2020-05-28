import "package:flutter/material.dart";

class Header extends StatelessWidget {
  final String title;
  Header({this.title});

  Widget build(BuildContext ctx) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(20),
      // alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}