import 'package:personal_budget/models/category.dart';

abstract class CategoryRepository {

  Future<List<Category>> getCategories();
  void addCategory(Category category);
  void updateCategory(Category category);
  void deleteCategory(Category category);
}
