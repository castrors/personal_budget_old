import 'package:personal_budget/bloc/blocs.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'fixtures/common_mocks.dart';
import 'fixtures/fixtures.dart';

void main() {
  RecordBloc recordBloc;
  MockRecordRepository recordRepository;
  group('recordBloc', () {
    setUp(() {
      recordRepository = MockRecordRepository();
      recordBloc = RecordBloc(recordRepository: recordRepository);
    });

    test('initial state is RecordEmpty', () {
      expect(recordBloc.initialState, RecordEmpty());
    });

    test(
        '''emits a loading state and then an loaded state with a list that contains recordOne''',
        () {
      final records = [recordOne];
      final expected = [
        RecordEmpty(),
        RecordLoading(),
        RecordLoaded(records: records),
      ];

      when(recordRepository.getRecords())
          .thenAnswer((_) => Future.value(records));
      expectLater(recordBloc.state, emitsInOrder(expected));
      recordBloc.dispatch(FetchRecord());
    });

    test('emits a loading state and then an error state', () {
      final expected = [
        RecordEmpty(),
        RecordLoading(),
        RecordError(),
      ];

      when(recordRepository.getRecords()).thenThrow(Exception('error'));
      expectLater(recordBloc.state, emitsInOrder(expected));
      recordBloc.dispatch(FetchRecord());
    });
  });
}
