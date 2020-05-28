import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJSON(Map<String, dynamic> parsedJSON)
    : id = parsedJSON["id"] ?? 0,
      deleted = parsedJSON["deleted"] ?? false,
      type = parsedJSON["type"] ?? "",
      by = parsedJSON["by"] ?? "",
      time = parsedJSON["time"] ?? 0,
      text = parsedJSON["text"] ?? "",
      dead = parsedJSON["dead"] ?? false,
      parent = parsedJSON["parent"],
      kids = parsedJSON["kids"] ?? [],
      url = parsedJSON["url"] ?? "",
      score = parsedJSON["score"] ?? 0,
      title = parsedJSON["title"] ?? "",
      descendants = parsedJSON["descendants"] ?? 0;

  ItemModel.fromDB(Map<String, dynamic> parsedJSON)
    : id = parsedJSON["id"],
      deleted = parsedJSON["deleted"] == 1,
      type = parsedJSON["type"],
      by = parsedJSON["by"],
      time = parsedJSON["time"],
      text = parsedJSON["text"],
      dead = parsedJSON["dead"] == 1,
      parent = parsedJSON["parent"],
      kids = jsonDecode(parsedJSON["kids"]), //blob -> List
      url = parsedJSON["url"],
      score = parsedJSON["score"],
      title = parsedJSON["title"],
      descendants = parsedJSON["descendants"];

  Map<String, dynamic> toMapForDb() {
    return <String, dynamic>{
       "id": id,
       "deleted": deleted ? 1 : 0,
       "type": type,
       "by": by,
       "time": time,
       "text": text,
       "dead": dead ? 1 : 0,
       "parent": parent,
       "kids": jsonEncode(kids),
       "url": url,
       "score": score,
       "title": title,
       "descendants": descendants,
    };
  }
}