import 'package:personal_budget/data/category_repository.dart';
import 'package:personal_budget/models/category.dart';
import 'package:sqflite/sqflite.dart';

///CategoryRepository
class CategoryRepositoryImpl implements CategoryRepository {
  ///Database instance
  Database database;

  ///Constructor
  CategoryRepositoryImpl(this.database);

  ///Provide a list of categories
  Future<List<Category>> getCategories() async {
    var categoriesMap = await database.rawQuery('SELECT * FROM Category');
    return categoriesMap.map((item) => Category.fromJson(item)).toList();
  }

  ///Add a category into the database
  void addCategory(Category category) async {
    await database.transaction((txn) async {
      var id1 = await txn.rawInsert('''
          INSERT INTO Category (title, color) 
          VALUES("${category.title}", ${category.color})
          ''');
      print('inserted1: $id1');
    });
  }

  ///Update an existent category into the database
  void updateCategory(Category category) async {
    await database.transaction((txn) async {
      var id1 = await txn.rawUpdate(
          'UPDATE Category SET title = ?, color = ? WHERE category_id = ?',
          ['${category.title}', '${category.color}', '${category.id}']);
      print('updated1: $id1');
    });
  }

  ///Delete an existent category into the database
  void deleteCategory(Category category) async {
    await database.transaction((txn) async {
      var id1 = await txn.rawDelete(
          'DELETE FROM Category WHERE category_id = ?', ['${category.id}']);
      print('deleted: $id1');
    });
  }
}
