import 'package:sqflite/sqflite.dart';
import 'package:personal_budget/models/record.dart';

/// RecordRepository
abstract class RecordRepository {
  ///Database instance
  Database database;

  ///Constructor
  RecordRepository(this.database);

  ///Provides a list of records
  Future<List<Record>> getRecords();

  ///Add a record into the database
  void addRecord(Record record);

  ///Update a record into the database
  void updateRecord(Record record);

  ///Delete a record into the database
  void deleteRecord(Record record);
}
