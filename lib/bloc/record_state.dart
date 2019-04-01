import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/record.dart';

abstract class RecordState extends Equatable {
  RecordState([List props = const []]) : super(props);
}

class RecordEmpty extends RecordState {}

class RecordLoading extends RecordState {}

class RecordLoaded extends RecordState {
  final List<Record> records;

  RecordLoaded({@required this.records})
      : assert(records != null),
        super([records]);
}

class RecordSaved extends RecordState {
  final Record record;

  RecordSaved({@required this.record})
      : assert(record != null),
        super([record]);
}

class RecordError extends RecordState {}
