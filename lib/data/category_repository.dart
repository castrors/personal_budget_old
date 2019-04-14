import 'package:personal_budget/models/category.dart';
import 'package:sqflite/sqflite.dart';

class CategoryRepository {

  Database database;

  CategoryRepository({this.database});

  Future<List<Map>> getCategories() async {
    return await database.rawQuery('SELECT * FROM Category');
  }

  addCategory(Category category) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Category (title, color) VALUES("${category.title}", ${category.color})');
      print('inserted1: $id1');
    });
  }

  updateCategory( Category category) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawUpdate(
          'UPDATE Category SET title = ?, color = ? WHERE id = ?',
          ['${category.title}', '${category.color}', '${category.id}']);
      print('updated1: $id1');
    });
  }

  deleteCategory( Category category) async {
    await database.transaction((txn) async {
      int id1 = await txn
          .rawDelete('DELETE FROM Category WHERE id = ?', ['${category.id}']);
      print('deleted: $id1');
    });
  }
}
