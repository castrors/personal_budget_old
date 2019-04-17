import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/data/record_repository.dart';

/// RecordBloc
class RecordBloc extends Bloc<RecordEvent, RecordState> {
  ///Repository necessary
  final RecordRepository recordRepository;
  ///Constructor
  RecordBloc({@required this.recordRepository});

  @override
  RecordState get initialState => RecordEmpty();

  @override
  Stream<RecordState> mapEventToState(
      RecordState currentState, RecordEvent event) async* {
    if (event is FetchRecord) {
      yield RecordLoading();
      try {
        final records = await recordRepository.getRecords();
        print(records);
        yield RecordLoaded(records: records);
      } on Exception catch (e) {
        print(e.toString());
        yield RecordError();
      }
    }
    if (event is AddRecord) {
      yield RecordLoading();
      try {
        final record = await recordRepository.addRecord(event.record);
        yield RecordSaved(record: record);
      }  on Exception catch (e) {
        print(e.toString());
        yield RecordError();
      }
    }
    if (event is UpdateRecord) {
      yield RecordLoading();
      try {
        final record = await recordRepository.updateRecord(event.record);
        yield RecordSaved(record: record);
      }  on Exception catch (e) {
        print(e.toString());
        yield RecordError();
      }
    }
    if (event is DeleteRecord) {
      yield RecordLoading();
      try {
        final record = await recordRepository.deleteRecord(event.record);
        yield RecordDeleted(record: record);
      }  on Exception catch (e) {
        print(e.toString());
        yield RecordError();
      }
    }
  }
}
