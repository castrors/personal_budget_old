import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/record/record_repository.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {

  final RecordRepository recordRepository;

  RecordBloc({@required this.recordRepository});

  @override
  RecordState get initialState => RecordEmpty();

  @override
  Stream<RecordState> mapEventToState(RecordState currentState, RecordEvent event
  ) async* {
    if(event is FetchRecord){
      yield RecordLoading();
      try {
        final List<Record> records = recordRepository.getRecords();
        yield RecordLoaded(records: records);
      } catch (e) {
        yield RecordError();
      }
    }
    if(event is AddRecord){
      yield RecordLoading();
      try {
        final record = recordRepository.addRecord(event.record);
        yield RecordSaved(record: record);
      } catch (e) {
        yield RecordError();
      }
    }
  }

}