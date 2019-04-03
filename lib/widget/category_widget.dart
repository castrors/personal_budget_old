import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.record,
    @required RecordData data,
  }) : _data = data, super(key: key);

  final Record record;
  final RecordData _data;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:  record != null ? record.category : "",
      decoration:
          InputDecoration(hintText: 'Escolha uma categoria'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, selecione uma categoria da sua receita.';
        }
      },
      onSaved: (String category) {
        this._data.category = category;
      },
    );
  }
}