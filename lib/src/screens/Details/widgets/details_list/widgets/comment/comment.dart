import "package:flutter/material.dart";
import "package:html/parser.dart";

class Comment extends StatelessWidget {
  final String title;
  final String author;
  final int depth;
  Comment({this.title, this.author, this.depth});

  String _parseHtmlString(String htmlString) {

    var document = parse(htmlString);

    String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  Widget build(BuildContext ctx) {
    var text = _parseHtmlString(title);
    return ListTile(
      contentPadding: EdgeInsets.only(
        right: 10.0,
        left: depth * 16.0 + 10
      ),
      title: Text(text),
      subtitle: author == "" ? Text("deleted") : Text(" by - $author"),
    );
  }
}