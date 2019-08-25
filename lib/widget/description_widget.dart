import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';

class DescriptionWidget extends StatelessWidget {
  final Record record;
  final Function onSaveCallback;

  DescriptionWidget({@required this.record, @required this.onSaveCallback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: record != null ? record.description : "",
        decoration: InputDecoration(
          labelText: record.isExpense
              ? 'Descreva o que você gastou'
              : 'Descreva o que você recebeu',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return record.isExpense
                ? 'Por favor, crie uma descrição da sua despesa.'
                : 'Por favor, crie uma descrição da sua receita.';
          }
        },
        onSaved: onSaveCallback);
  }
}
