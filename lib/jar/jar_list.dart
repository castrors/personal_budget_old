import 'package:flutter/material.dart';
import 'package:personal_budget/models/jar.dart';
import 'package:personal_budget/widget/expense_pot_widget.dart';

class JarList extends StatefulWidget {
  @override
  _JarListState createState() => _JarListState();
}

class _JarListState extends State<JarList> {
  var jars = [
    Jar('Contas Fixas', 55),
    Jar('Lazer', 10),
    Jar('Futuro', 10),
    Jar('Educação', 10),
    Jar('Consumo', 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Potes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jars.length,
          itemBuilder: (context, index) {
            return ExpensePot(
              amount: jars[index].amount,
              label: jars[index].label,
              onChangeCallback: (double value) {
                setState(() {
                  jars[index].amount = value.floor();
                });
              },
            );
          },
        ),
      ),
    );
  }
}