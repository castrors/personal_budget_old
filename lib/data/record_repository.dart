import 'package:personal_budget/models/record.dart';

abstract class RecordRepository {
  
  Future<List<Record>> getRecords();  
  void addRecord(Record record);
  void updateRecord(Record record);
  void deleteRecord(Record record);
}
