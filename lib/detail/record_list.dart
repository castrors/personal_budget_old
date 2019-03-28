import 'package:flutter/material.dart';
import 'package:personal_budget/detail/record_detail.dart';

class RecordList extends StatefulWidget {
  RecordList({Key key}) : super(key: key);

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  void _navigateToRecordDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordDetail(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        bottom: PreferredSize(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(80.0, 0.0, 16.0, 32.0),
              child: Text('title')),
          preferredSize: Size(0.0, 80.0),
        ),
      ),
      body: Text('text'),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToRecordDetail,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
