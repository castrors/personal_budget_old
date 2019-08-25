import 'package:personal_budget/models/category.dart';

///CategoryRepository
abstract class CategoryRepository {
  ///Provide a list of categories
  Future<List<Category>> getCategories();

  ///Add a category into the database
  void addCategory(Category category);

  ///Update an existent category into the database
  void updateCategory(Category category);

  ///Delete an existent category into the database
  void deleteCategory(Category category);
}
