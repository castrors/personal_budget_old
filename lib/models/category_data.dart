import 'package:personal_budget/models/category.dart';


///Category data
class CategoryData {
  ///category id
  int id;
  ///category title
  String title;
  ///category color
  int color;

  ///Transform category data in category
  Category toPersistentModel(int id ,int color) {
    return Category(
        id: id,
        title: title,
        color: color);
  }
}
