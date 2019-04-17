import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/record.dart';

///Record events to RecordBloc
abstract class RecordEvent extends Equatable {}

///Event to fetch record
class FetchRecord extends RecordEvent {}

///Event to add a record
class AddRecord extends RecordEvent {
  ///Record
  final Record record;

  ///Constructor
  AddRecord({@required this.record});
}

///Event to update a record
class UpdateRecord extends RecordEvent {
  ///Record
  final Record record;

  ///Constructor
  UpdateRecord({@required this.record});
}

///Event to delete a record
class DeleteRecord extends RecordEvent {
  ///Record
  final Record record;

  ///Constructor
  DeleteRecord({@required this.record});
}
