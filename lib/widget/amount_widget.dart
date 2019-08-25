import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';

class AmountWidget extends StatelessWidget {
  final Record record;
  final Function onSaveCallback;

  AmountWidget({
    @required this.record,
    @required this.onSaveCallback,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white, fontSize: 40),
      initialValue: record.amount != null ? record.amount.toString() : "",
      decoration: InputDecoration(
          labelText: record.isExpense ? 'Valor da Despesa' : 'Valor da Receita',
          prefixText: 'R\$ ',
          prefixStyle: TextStyle(color: Colors.white, fontSize: 30),
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          errorStyle: TextStyle(color: Colors.white),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, adicione a quantidade da sua ${record.isExpense ? 'despesa' : 'receita'}.';
        }
      },
      onSaved: onSaveCallback,
    );
  }
}
