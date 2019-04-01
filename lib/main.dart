import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:personal_budget/record/record_list.dart';
import 'package:personal_budget/record/record_repository.dart';
import 'package:personal_budget/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final RecordRepository recordRepository = RecordRepository();
  runApp(App(recordRepository: recordRepository));
}

class App extends StatefulWidget {
  RecordRepository recordRepository;

  App({Key key, @required this.recordRepository})
      : assert(recordRepository != null),
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.teal),
      home: RecordList(recordRepository: widget.recordRepository),
    );
  }
}
