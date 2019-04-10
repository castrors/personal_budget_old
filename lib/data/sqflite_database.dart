import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDatabase {
  Future<Database> createDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'personal_budget.db'),
        version: 2,
        onCreate: this._create);
  }

  Future _create(Database db, int version) async {
    await db.execute(
        "CREATE TABLE Category ("
            "id INTEGER PRIMARY KEY,"
            "title TEXT,"
            "color INTEGER"
            ") "
    );
    await db.execute(
        "CREATE TABLE Record ("
            "id INTEGER PRIMARY KEY,"
            "amount REAL,"
            "description TEXT,"
            "category_id INTEGER NOT NULL,"
            "date INTEGER,"
            "is_expense INTEGER,"
            "FOREIGN KEY (category_id) REFERENCES Category(id)"
            ") "
    );
  }
}
