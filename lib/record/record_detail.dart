import 'package:flutter/material.dart';
import 'package:personal_budget/models/record.dart';
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

  Record _record;

  void _submit(bool isExpense) {
    var formBody = _formKey.currentState.validate();
    var formHeader = _formKeyAmount.currentState.validate();

    if (formBody && formHeader && _record.category != null) {
      _formKey.currentState.save();
      _formKeyAmount.currentState.save();
      _record.isExpense = isExpense;
      Navigator.pop(context, _record);
    }
  }

  @override
  void initState() {
    super.initState();
    _record = widget.record;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Switch(
            value: _record.isExpense,
            onChanged: (value) {
              setState(() {
                _record.isExpense = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.red,
            inactiveTrackColor: Colors.red.shade300,
          ),
        ],
        backgroundColor:
            _record.isExpense ? Colors.redAccent : Colors.lightGreen.shade500,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 16.0, 36.0),
            child: Form(
              key: _formKeyAmount,
              child: AmountWidget(
                  record: _record,
                  onSaveCallback: (amount) {
                    _record.amount = double.parse(amount);
                  }),
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
                    record: _record,
                    onSaveCallback: (description) {
                      _record.description = description;
                    },
                  ),
                  CategoryWidget(record: _record, data: _record),
                  DatePickerWidget(
                    record: _record,
                    onSaveCallback: (date) {
                      _record.date = date;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submit(_record.isExpense);
        },
        tooltip: 'Increment',
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
