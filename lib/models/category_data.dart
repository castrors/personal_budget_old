import 'package:personal_budget/models/category.dart';

class CategoryData {
  String title;
  int color;

  Category toPersistentModel(int color) {
    return Category(
        title: this.title,
        color: color);
  }
}
