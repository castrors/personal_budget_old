import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({
    Key key,
    @required this.record,
    @required this.isSwitched,
    @required RecordData data,
  }) : _data = data, super(key: key);

  final Record record;
  final bool isSwitched;
  final RecordData _data;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white, fontSize: 40),
      initialValue:  record != null ? record.amount.toString() : "",
      decoration: InputDecoration(
          labelText:
              isSwitched ?  'Valor da Despesa': 'Valor da Receita',
          prefixText: 'R\$ ',
          prefixStyle: TextStyle(color: Colors.white, fontSize: 30),
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, adicione a quantidade da sua receita.';
        }
      },
      onSaved: (String amount) {
        this._data.amount = double.parse(amount);
      },
    );
  }
}