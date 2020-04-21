import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/models/record.dart';

class DatePickerWidget extends StatelessWidget {
  final Record record;
  final Function onSaveCallback;

  DatePickerWidget({@required this.record, @required this.onSaveCallback});

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
        initialValue: record != null ? record.date : null,
        format: DateFormat('yyyy-MM-dd'),
        decoration:
            InputDecoration(labelText: 'Data', hasFloatingPlaceholder: false),
        validator: (value) {
          if (value == null) {
            return record.isExpense
                ? '''Por favor, selecione a data da sua despesa.'''
                : 'Por favor, selecione a data da sua receita.';
          }
        },
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
        onSaved: onSaveCallback);
  }
}
