import 'package:sqflite/sqflite.dart';
import 'package:personal_budget/models/record.dart';

class RecordRepository {
  Database database;

  RecordRepository({this.database});

  Future<List<Map>> getRecords() async {
    return await database.rawQuery('SELECT * FROM Record INNER JOIN Category on Category.id = Record.category_id');
  }

  addRecord(Record record) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Record(amount, description, category_id, date, is_expense) VALUES(${record.amount}, "${record.description}", "${record.category.id}", ${record.date.microsecondsSinceEpoch}, ${record.isExpense ? 1 : 0})');
      print('inserted1: $id1');
    });
  }

  updateRecord(Record record) async {
    await database.transaction((txn) async {
      int id1 = await txn.rawUpdate(
          'UPDATE Record SET amount = ?, description = ?, category_id = ?, date = ?, is_expense = ? WHERE id = ?',
          [
            '${record.amount}',
            '${record.description}',
            '${record.category.id}',
            '${record.date.microsecondsSinceEpoch}',
            '${record.isExpense ? 1 : 0}',
            '${record.id}'
          ]);
      print('updated1: $id1');
    });
  }

  deleteRecord(Record record) async {
    await database.transaction((txn) async {
      int id1 = await txn
          .rawDelete('DELETE FROM Record WHERE id = ?', ['${record.id}']);
      print('deleted: $id1');
    });
  }
}
