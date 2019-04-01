
import 'package:personal_budget/models/record.dart';

class RecordRepository {
  
  List<Record> _records = [];

  List<Record> getRecords() {
    return _records;
  }

  Record addRecord(Record record){
    _records.add(record);
    return record;
  }
}