import 'package:sqflite/sqflite.dart';
import 'package:personal_budget/models/record.dart';

/// RecordRepository
class RecordRepository {
  ///Database instance
  Database database;

  ///Constructor
  RecordRepository({this.database});

  ///Provides a list of records
  Future<List<Record>> getRecords() async {
    List<Map> recordsMap = await database.rawQuery('''SELECT * FROM Record INNER JOIN Category on Category.id = Record.category_id''');
    return recordsMap.map((item) => Record.fromJson(item)).toList();
  }

  ///Add a record into the database
  Future<Record> addRecord(Record record) async {
    return await database.transaction((txn) async {
      var id1 = await txn.rawInsert('''INSERT INTO Record(amount, description, category_id, date, is_expense) VALUES(${record.amount}, "${record.description}", "${record.category.id}", ${record.date.microsecondsSinceEpoch}, ${record.isExpense ? 1 : 0})''');
      print('inserted1: $id1');
    });
  }

  ///Update a record into the database
  Future<Record> updateRecord(Record record) async {
    return await database.transaction((txn) async {
      var id1 = await txn.rawUpdate(
          '''UPDATE Record SET amount = ?, description = ?, category_id = ?, date = ?, is_expense = ? WHERE id = ?''',
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

  ///Delete a record into the database
  Future<Record> deleteRecord(Record record) async {
    return await database.transaction((txn) async {
      var id1 = await txn
          .rawDelete('DELETE FROM Record WHERE id = ?', ['${record.id}']);
      print('deleted: $id1');
    });
  }
}
