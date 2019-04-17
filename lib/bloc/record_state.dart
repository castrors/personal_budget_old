import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/record.dart';

///RecordState is a result to RecordEvents
abstract class RecordState extends Equatable {
  ///Constructor
  RecordState([List props = const []]) : super(props);
}

///Result when there is no record
class RecordEmpty extends RecordState {}

///Result when is loading records
class RecordLoading extends RecordState {}

///Result when records are loaded
class RecordLoaded extends RecordState {
  ///Records
  final List<Record> records;

  ///Constructor
  RecordLoaded({@required this.records})
      : assert(records != null),
        super([records]);
}

///Result when record is saved with success
class RecordSaved extends RecordState {}

///Result when record is deleted with success
class RecordDeleted extends RecordState {}

///Result when an error occurs
class RecordError extends RecordState {}
