import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key key,
    @required this.record,
    @required RecordData data,
    @required this.isExpense
  }) : _data = data, super(key: key);

  final Record record;
  final RecordData _data;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:  record != null ? record.description : "",
      decoration: InputDecoration(
        labelText: isExpense? 'Descreva o que você gastou' : 'Descreva o que você recebeu',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return isExpense? 'Por favor, crie uma descrição da sua despesa.': 'Por favor, crie uma descrição da sua receita.';
        }
      },
      onSaved: (String description) {
        this._data.description = description;
      },
    );
  }
}