import 'package:equatable/equatable.dart';

class Category extends Equatable {
  int id;

  String title;

  int color;

  Category({this.id, this.title, this.color}) : super([id, title, color]);

  factory Category.fromJson(Map<String, dynamic> data) => Category(
      id: data["category_id"], title: data["title"], color: data["color"]);

  Map<String, dynamic> toJson() => {
        "category_id": id,
        "title": title,
        "color": color,
      };

  Category clone(int id, String title, int color) =>
      Category(id: id, title: title, color: color);
}
