import 'package:equatable/equatable.dart';

///Category model
class Category extends Equatable {
  ///category id
  final int id;

  ///category title
  final String title;

  ///category color
  final int color;

  ///Constructor
  Category({this.id, this.title, this.color}) : super([id, title, color]);

  ///Create a category from json
  factory Category.fromJson(Map<String, dynamic> data) =>
      Category(id: data["id"], title: data["title"], color: data["color"]);

  ///Converts a category to json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
      };

  ///Copy a category replacing the id
  Category clone(int id) => Category(id: id, title: title, color: color);
}
