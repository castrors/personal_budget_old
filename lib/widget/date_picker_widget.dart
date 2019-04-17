import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

///Date picker widget
class DatePickerWidget extends StatelessWidget {
  ///Record
  final Record record;
  ///Record data
  final RecordData _data;
  ///isExpense
  final bool isExpense;

  ///Constructor
  const DatePickerWidget({
    Key key,
    @required this.record,
    @required RecordData data,
    @required this.isExpense
  }) : _data = data, super(key: key);

  

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
          return isExpense? '''Por favor, selecione a data da sua despesa.''' : 'Por favor, selecione a data da sua receita.';
        }
      },
      onSaved: (date) {
        _data.date = date;
      },
    );
  }
}