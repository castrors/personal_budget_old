import 'package:flutter/material.dart';
import 'package:personal_budget/category/category_list.dart';
import 'package:personal_budget/jar/jar_list.dart';
import 'package:personal_budget/record/record_list.dart';
import 'package:personal_budget/report/report_list.dart';

/// Widget that contains the bottom navigation bar behavior
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Budget',
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.teal),
      home: Scaffold(
        body: [RecordList(), CategoryList(), JarList()][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Minhas finanças')),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categorias')),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_chart), title: Text('Potes')),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
