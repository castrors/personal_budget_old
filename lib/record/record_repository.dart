import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:personal_budget/models/record.dart';

class RecordRepository {
  
 Future<Database> createDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'personal_budget_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Record ("
              "id INTEGER PRIMARY KEY,"
              "amount REAL,"
              "description TEXT,"
              "category TEXT,"
              "date INTEGER,"
              "is_expense INTEGER"
              ")",
        );
      },
      version: 1,
    );
  }

  Future<List<Map>> getRecords() async {
    Database database = await createDatabase();
    return await database.rawQuery('SELECT * FROM Record');
  }

  addRecord(Record record) async {
    Database database = await createDatabase();
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
        'INSERT INTO Record(amount, description, category, date, is_expense) VALUES(${record.amount}, "${record.description}", "${record.category}", ${record.date.microsecondsSinceEpoch}, ${record.isExpense ? 1 : 0})');
      print('inserted1: $id1');
      
    });
  }
}
