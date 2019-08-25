import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';
import 'package:personal_budget/widget/amount_widget.dart';
import 'package:personal_budget/widget/category_widget.dart';
import 'package:personal_budget/widget/date_picker_widget.dart';
import 'package:personal_budget/widget/description_widget.dart';

///Record detail widget
class RecordDetail extends StatefulWidget {
  ///Record related
  final Record record;

  ///Constructor
  RecordDetail({Key key, this.record}) : super(key: key);

  @override
  _RecordDetailState createState() => _RecordDetailState();
}

class _RecordDetailState extends State<RecordDetail> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyAmount = GlobalKey<FormState>();
  final _data = RecordData();
  bool isExpense;

  void _submit(bool isExpense) {
    var formBody= _formKey.currentState.validate();
    var formHeader = _formKeyAmount.currentState.validate();

    if (formBody && formHeader && _data.category!=null) {
      _formKey.currentState.save();
      _formKeyAmount.currentState.save();
      Navigator.pop(context, _data.toPersistentModel(isExpense: isExpense));
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.record != null) {
      isExpense = widget.record.isExpense;
    } else {
      isExpense = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var record = widget.record;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Switch(
            value: isExpense,
            onChanged: (value) {
              setState(() {
                isExpense = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red.shade300,
          ),
        ],
        backgroundColor:
            isExpense ? Colors.redAccent : Colors.lightGreen.shade500,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 16.0, 36.0),
            child: Form(
              key: _formKeyAmount,
              child: AmountWidget(
                  record: record, isExpense: isExpense, data: _data),
            ),
          ),
          preferredSize: Size(0.0, 128.0),
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
                  DescriptionWidget(
                      record: record, data: _data, isExpense: isExpense),
                  CategoryWidget(
                              record: record,
                              data: _data),
                  DatePickerWidget(
                    record: record,
                    data: _data,
                    isExpense: isExpense,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submit(isExpense);
        },
        tooltip: 'Increment',
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
