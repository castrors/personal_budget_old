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

  List<int> items = [0,1,2];

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
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return provideListItem(index );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToRecordDetail,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget provideListItem(int index) {
    return ListTile(
        title: Text('ALIMENTAÇÃO', 
        style: TextStyle(
          color: Colors.orangeAccent,
          fontSize: 12,     
          fontWeight: FontWeight.bold
        ),),
        subtitle: Text('Casquinha mista ${items[index]}'),
        trailing: Column(
          children: <Widget>[
            Text('-R\$ 4,00',
             style: TextStyle(
               color: Colors.redAccent
             ),),
            Text('Dinheiro'),
          ],
        ),

      );
  }
}
