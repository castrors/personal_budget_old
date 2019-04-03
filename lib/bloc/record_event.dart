import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/record.dart';

abstract class RecordEvent extends Equatable {}

class FetchRecord extends RecordEvent {}

class AddRecord extends RecordEvent {
  final Record record;

  AddRecord({@required this.record});
}

class UpdateRecord extends RecordEvent {
  final Record record;

  UpdateRecord({@required this.record});
}