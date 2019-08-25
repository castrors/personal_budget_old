import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data_provider.dart';
import 'package:personal_budget/record/record_detail.dart';
import 'package:provider/provider.dart';

///RecordList widget
class RecordList extends StatelessWidget {

  void _navigateToRecordDetail(BuildContext context, Record record) async {
    final recordResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            RecordDetail(record: record),
      ),
    );
    if (recordResult != null) {
      if (record != null) {
        Provider.of<RecordDataProvider>(context)
            .updateRecord(recordResult);
      } else {
        Provider.of<RecordDataProvider>(context)
            .addRecord(recordResult);
      }
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
                  provideTotalAmount([]),
                  Text(provideLastMonthAndYear([]),
                      style: TextStyle(color: Colors.white)),
                ],
              )),
          preferredSize: Size(0.0, 80.0),
        ),
      ),
      body: Center(
        child: Consumer<RecordDataProvider>(
                  builder: (context, recordData, child) {
                return FutureBuilder<UnmodifiableListView<Record>>(
                  future: recordData.categories,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return provideListItem(
                                context, snapshot.data[index]);
                          });
                    }
                    return CircularProgressIndicator();
                  },
                );
              })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToRecordDetail(context, null);
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

  Widget provideListItem(BuildContext context, Record record) {
    return Dismissible(
      key: Key(record.description),
      onDismissed: (direction) {
        // _recordBloc.dispatch(DeleteRecord(record: record));
        // _recordBloc.dispatch(FetchRecord());

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
          _navigateToRecordDetail(context, record);
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

  Text provideFormattedDate(Record record) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Text(formatter.format(record.date));
  }
}
