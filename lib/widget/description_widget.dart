import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key key,
    @required this.record,
    @required RecordData data,
  }) : _data = data, super(key: key);

  final Record record;
  final RecordData _data;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:  record != null ? record.description : "",
      decoration: InputDecoration(
        labelText: 'Descreva o que você recebeu',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, crie uma descrição da sua receita.';
        }
      },
      onSaved: (String description) {
        this._data.description = description;
      },
    );
  }
}