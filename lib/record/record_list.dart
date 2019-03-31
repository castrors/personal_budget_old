import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/record/record_detail.dart';

class RecordList extends StatefulWidget {
  RecordList({Key key}) : super(key: key);

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  void _navigateToRecordDetail() async {
    final record = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecordDetail(),
      ),
    );

  setState(() {
    items.add(record);
  });
  }

  List<Record> items = [];

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
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return provideListItem(index);
          }),
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

  Widget provideListItem(int index) {
    return ListTile(
      title: Text(
        items[index].category,
        style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(items[index].description),
      trailing: Column(
        children: <Widget>[
          Text(
            'R\$ ${items[index].amount}',
            style: TextStyle(color: Colors.green),
          ),
          Text(items[index].date.toString()),
        ],
      ),
    );
  }
}
