import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:personal_budget/models/record.dart';

class RecordRepository {
  Database database;

  RecordRepository() {
    createDatabase();
  }

  createDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'personal_budget_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Record ("
              "id INTEGER PRIMARY KEY,"
              "amount REAL,"
              "description TEXT,"
              "category TEXT,"
              "date TEXT,"
              "is_expense INTEGER"
              ")",
        );
      },
      version: 1,
    );
  }

  Future<List<Record>> getRecords() async {
    var result = await database.rawQuery('SELECT * FROM Record');
    return result.map((item) => Record.fromJson(item));
  }

  addRecord(Record record) async {
    var result = await database.rawInsert(
        "INSERT INTO Record (amount, description, category, date, is_expense)"
        " VALUES (${record.amount},${record.description},${record.category},${record.date.toIso8601String()},${record.isExpense})");
    return result;
  }
}
