import 'package:personal_budget/models/category.dart';

class CategoryData {
  int id;
  String title;
  int color;

  Category toPersistentModel(int id ,int color) {
    return Category(
        id: id,
        title: this.title,
        color: color);
  }
}
