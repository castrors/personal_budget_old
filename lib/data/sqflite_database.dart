import 'dart:ui';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///Sqlflite database
class SqfliteDatabase {
  ///Creates database
  Future<Database> createDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'personal_budget.db'),
        version: 2,
        onCreate: _create);
  }

  Future _create(Database db, int version) async {
    await db.execute("CREATE TABLE Category ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        "color INTEGER"
        ") ");
    await db.execute("CREATE TABLE Record ("
        "id INTEGER PRIMARY KEY,"
        "amount REAL,"
        "description TEXT,"
        "category_id INTEGER NOT NULL,"
        "date INTEGER,"
        "is_expense INTEGER,"
        "FOREIGN KEY (category_id) REFERENCES Category(id)"
        ") ");

    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['alimentação', Color(0xfff5a623).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['educação', Color(0xff7ed321).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['financeiro', Color(0xffe24a8b).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['habitação', Color(0xffb83030).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['lazer', Color(0xff4adbe2).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['saúde', Color(0xff4a90e2).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['trabalho', Color(0xff3eba65).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['transporte', Color(0xffbb37d6).value]);
    await db.rawInsert('INSERT INTO Category (title, color) VALUES(?,?)',
        ['vestuário', Color(0xffedc100).value]);
  }
}
