import 'package:flutter/material.dart';

import 'package:personal_budget/record/record_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.teal),
      home: RecordList(),
    );
  }
}

