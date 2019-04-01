import 'package:flutter/material.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/record/record_detail.dart';
import 'package:personal_budget/record/record_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordList extends StatefulWidget {
  final RecordRepository recordRepository;
  RecordList({Key key, @required this.recordRepository})
      : assert(recordRepository != null),
        super(key: key);

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  RecordBloc _recordBloc;

  @override
  void initState() {
    super.initState();
    _recordBloc = RecordBloc(recordRepository: widget.recordRepository);
    _recordBloc.dispatch(FetchRecord());
  }

  void _navigateToRecordDetail() async {
    final record = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordDetail(),
      ),
    );
    if(record!=null){
      _recordBloc.dispatch(AddRecord(record: record));
      _recordBloc.dispatch(FetchRecord());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              child: Column(
                children: <Widget>[
                  Text('SALDO ATUAL',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('R\$ 2300,00',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.lightGreen.shade200)),
                  Text('Março 2019', style: TextStyle(color: Colors.white)),
                ],
              )),
          preferredSize: Size(0.0, 80.0),
        ),
      ),
      body: Center(
          child: BlocBuilder(
              bloc: _recordBloc,
              builder: (_, RecordState state) {
                if (state is RecordEmpty) {
                  return Center(child: Text('RecordEmpty'));
                }
                if (state is RecordLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is RecordLoaded) {
                  final records = state.records;
                  return ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (BuildContext context, int index) {
                        return provideListItem(records[index]);
                      });
                }
                if(state is RecordError){
                  return Center(child: Text('RecordError'));
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToRecordDetail,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Minhas finanças')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categorias')),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart), title: Text('Relatórios')),
        ],
      ),
    );
  }

  Widget provideListItem(Record record) {
    return ListTile(
      title: Text(
        record.category,
        style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(record.description),
      trailing: Column(
        children: <Widget>[
          provideAmound(record),
          Text(record.date.toString()),
        ],
      ),
    );
  }

  provideAmound(Record item) {
    return item.isExpense
        ? Text(
            '- R\$ ${item.amount}',
            style: TextStyle(color: Colors.red),
          )
        : Text(
            'R\$ ${item.amount}',
            style: TextStyle(color: Colors.green),
          );
  }
}
