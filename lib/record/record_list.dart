import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/main.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/record/record_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///RecordList widget
class RecordList extends StatefulWidget {
  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  
  List<Category> categories;

  void _navigateToRecordDetail(Record record) async {
    final recordResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RecordDetail(record: record, categories: categories),
      ),
    );
    if (recordResult != null) {
      if (record != null) {
        _recordBloc
            .dispatch(UpdateRecord(record: recordResult.clone(record.id)));
      } else {
        _recordBloc.dispatch(AddRecord(record: recordResult));
      }
      _recordBloc.dispatch(FetchRecord());
    }
  }

  @override
  Widget build(BuildContext context) {
    _recordBloc = App.of(context).recordBloc;
    _recordBloc.dispatch(FetchRecord());
    _categoryBloc = App.of(context).categoryBloc;

    _categoryBloc.categoryRepository
        .getCategories()
        .then((categoriesResult) => categories = categoriesResult)
        .catchError((categoriesResult) => categories = []);

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
            child: BlocBuilder(
                bloc: _recordBloc,
                builder: (_, state) {
                  if (state is RecordLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is RecordLoaded) {
                    return Column(
                      children: <Widget>[
                        Text('SALDO ATUAL',
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        provideTotalAmount(state.records),
                        Text(provideLastMonthAndYear(state.records),
                            style: TextStyle(color: Colors.white)),
                      ],
                    );
                  }
                }),
          ),
          preferredSize: Size(0.0, 80.0),
        ),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: _recordBloc,
            builder: (_, state) {
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
                    itemBuilder: (context, index) {
                      return provideListItem(records[index]);
                    });
              }
              if (state is RecordError) {
                return Center(child: Text('RecordError'));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToRecordDetail(null);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Text provideTotalAmount(List<Record> records) {
    var totalAmount = records.map((record) {
      return record.isExpense ? record.amount * -1 : record.amount;
    }).fold(0, (previous, current) => previous + current);
    return Text('R\$ $totalAmount',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w300,
            color: Colors.lightGreen.shade200));
  }

  String provideLastMonthAndYear(List<Record> records) {
    var newestDate = DateTime(1900);
    final formatter = DateFormat('MMMM yyyy');
    for (var record in records) {
      if (record.date.compareTo(newestDate) > 0) {
        newestDate = record.date;
      }
    }
    return formatter.format(newestDate);
  }

  Widget provideListItem(Record record) {
    return Dismissible(
      key: Key(record.description),
      onDismissed: (direction) {
        _recordBloc.dispatch(DeleteRecord(record: record));
        _recordBloc.dispatch(FetchRecord());

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("${record.id} dismissed")));
      },
      child: ListTile(
        title: Text(
          record.category.title,
          style: TextStyle(
              color: Color(record.category.color),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(record.description),
        trailing: Column(
          children: <Widget>[
            provideAmount(record),
            provideFormattedDate(record),
          ],
        ),
        onTap: () {
          _navigateToRecordDetail(record);
        },
      ),
    );
  }

  ///Provide amount text from record
  Text provideAmount(Record item) {
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

  Text provideFormattedDate(Record record){
    final formatter = DateFormat('dd/MM/yyyy');
    return Text(formatter.format(record.date));
  }
}
