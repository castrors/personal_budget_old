import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

///Description widget
class DescriptionWidget extends StatelessWidget {
  ///Record
  final Record record;

  ///Record data
  final RecordData _data;

  ///isExpense
  final bool isExpense;

  ///Constructor
  const DescriptionWidget(
      {Key key,
      @required this.record,
      @required RecordData data,
      @required this.isExpense})
      : _data = data,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: record != null ? record.description : "",
      decoration: InputDecoration(
        labelText: isExpense
            ? 'Descreva o que você gastou'
            : 'Descreva o que você recebeu',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return isExpense
              ? 'Por favor, crie uma descrição da sua despesa.'
              : 'Por favor, crie uma descrição da sua receita.';
        }
      },
      onSaved: (description) {
        _data.description = description;
      },
    );
  }
}
