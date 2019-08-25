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
    return DateTimePickerFormField(
        initialValue: record != null ? record.date : null,
        inputType: InputType.date,
        format: DateFormat('yyyy-MM-dd'),
        editable: true,
        decoration:
            InputDecoration(labelText: 'Data', hasFloatingPlaceholder: false),
        validator: (value) {
          if (value == null) {
            return record.isExpense
                ? '''Por favor, selecione a data da sua despesa.'''
                : 'Por favor, selecione a data da sua receita.';
          }
        },
        onSaved: onSaveCallback);
  }
}
