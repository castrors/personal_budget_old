import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key key,
    @required this.record,
    @required RecordData data,
  }) : _data = data, super(key: key);

  final Record record;
  final RecordData _data;

  @override
  Widget build(BuildContext context) {
    return DateTimePickerFormField(
      initialValue:  record != null ? record.date : null,
      inputType: InputType.date,
      format: DateFormat('yyyy-MM-dd'),
      editable: true,
      decoration: InputDecoration(
          labelText: 'Data', hasFloatingPlaceholder: false),
      validator: (value) {
        if (value == null) {
          return 'Por favor, selecione a data da sua receita.';
        }
      },
      onSaved: (DateTime date) {
        this._data.date = date;
      },
    );
  }
}