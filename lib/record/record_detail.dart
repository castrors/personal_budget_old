import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_budget/models/record.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RecordDetail extends StatefulWidget {
  RecordDetail({Key key}) : super(key: key);

  @override
  _RecordDetailState createState() => _RecordDetailState();
}

class _RecordData {
  double amount;
  String description;
  String category;
  DateTime date;

  Record toPersistentModel(bool isExpense) {
    return Record(
        amount: this.amount,
        description: this.description,
        category: this.category,
        date: this.date,
        isExpense: isExpense);
  }
}

class _RecordDetailState extends State<RecordDetail> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyAmount = GlobalKey<FormState>();
  _RecordData _data = _RecordData();

  bool isSwitched = false;

  void _submit() {
    if (_formKey.currentState.validate() &&
        _formKeyAmount.currentState.validate()) {
      _formKey.currentState.save();
      _formKeyAmount.currentState.save();
      Navigator.pop(context, _data.toPersistentModel(isSwitched));
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 40),
                decoration: InputDecoration(
                    labelText:
                        isSwitched ?  'Valor da Despesa': 'Valor da Receita',
                    prefixText: 'R\$ ',
                    prefixStyle: TextStyle(color: Colors.white, fontSize: 30),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, adicione a quantidade da sua receita.';
                  }
                },
                onSaved: (String amount) {
                  this._data.amount = double.parse(amount);
                },
              ),
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
                  TextFormField(
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
                  ),
                  TextFormField(
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
                  ),
                  DateTimePickerFormField(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        tooltip: 'Increment',
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
