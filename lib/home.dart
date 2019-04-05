import 'package:flutter/material.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/category/category_list.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/record/record_detail.dart';
import 'package:personal_budget/record/record_list.dart';
import 'package:personal_budget/record/record_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_budget/report/report_list.dart';

class Home extends StatefulWidget {
  final RecordRepository recordRepository;
  Home({Key key, @required this.recordRepository})
      : assert(recordRepository != null),
        super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  List<Widget> _children;

  @override
  void initState() {
    super.initState();
    final RecordRepository recordRepository = widget.recordRepository;
    _children = [
      RecordList(recordRepository: recordRepository),
      CategoryList(),
      ReportList()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Minhas finanças')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categorias')),
          BottomNavigationBarItem(
              icon: Icon(Icons.table_chart), title: Text('Relatórios')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
