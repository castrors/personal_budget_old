import 'package:flutter/material.dart';

class RecordDetail extends StatefulWidget {
  RecordDetail({Key key}) : super(key: key);

  @override
  _RecordDetailState createState() => _RecordDetailState();
}

class _RecordDetailState extends State<RecordDetail> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyAmount = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
    if (_formKeyAmount.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade500,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 16.0, 36.0),
            child: Form(
              key: _formKeyAmount,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white, fontSize: 40),
                decoration: InputDecoration(
                    labelText: 'Valor da Receita',
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
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: 'Escolha uma categoria'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, selecione uma categoria da sua receita.';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Data'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, selecione a data da sua receita.';
                      }
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
