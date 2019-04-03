import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/models/record.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:personal_budget/models/record_data.dart';
import 'package:personal_budget/widget/amount_widget.dart';
import 'package:personal_budget/widget/category_widget.dart';
import 'package:personal_budget/widget/date_picker_widget.dart';
import 'package:personal_budget/widget/description_widget.dart';

class RecordDetail extends StatefulWidget {
  final Record record;
  RecordDetail({Key key, this.record}) : super(key: key);

  @override
  _RecordDetailState createState() => _RecordDetailState();
}

class _RecordDetailState extends State<RecordDetail> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyAmount = GlobalKey<FormState>();
  RecordData _data = RecordData();
  bool isSwitched = false;

  void _submit(bool isExpense) {
    if (_formKey.currentState.validate() &&
        _formKeyAmount.currentState.validate()) {
      _formKey.currentState.save();
      _formKeyAmount.currentState.save();
      Navigator.pop(context, _data.toPersistentModel(isExpense));
    }
  }

  @override
  Widget build(BuildContext context) {
    Record record = widget.record;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                  isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red.shade300,
          ),
        ],
        backgroundColor:
            isSwitched ? Colors.redAccent : Colors.lightGreen.shade500,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 16.0, 36.0),
            child: Form(
              key: _formKeyAmount,
              child: AmountWidget(
                  record: record, isSwitched: isSwitched, data: _data),
            ),
          ),
          preferredSize: Size(0.0, 100.0),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  DescriptionWidget(record: record, data: _data),
                  CategoryWidget(record: record, data: _data),
                  DatePickerWidget(record: record, data: _data),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submit(isSwitched);
        },
        tooltip: 'Increment',
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
