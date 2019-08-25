import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:personal_budget/data/record_repository.dart';
import 'package:personal_budget/models/record.dart';

class RecordData extends ChangeNotifier {

  final RecordRepository _repository;
  
  RecordData(this._repository);

  Future<UnmodifiableListView<Record>> get categories async {
    var records = await _repository.getRecords();
    return UnmodifiableListView(records);
  }


  void updateRecord(Record record){
    _repository.updateRecord(record);
    notifyListeners();
  }


  void addRecord(Record record){
    _repository.addRecord(record);
    notifyListeners();
  }


  void deleteRecord(Record record) {
    _repository.deleteRecord(record);
    notifyListeners();
  }
}
