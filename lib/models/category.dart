import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String title;
  final String color;

  Category(
      {this.id,
      this.title,
      this.color})
      : super([id, title, color]);

  factory Category.fromJson(Map<String, dynamic> data) => Category(
      id: data["id"],
      title: data["title"],
      color: data["color"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
      };

  Category clone(int id) => Category(
      id: id,
      title: this.title,
      color: this.color);
}
