import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.green),
      home: MyHomePage(title: 'Cadastrar receita'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        backgroundColor: Colors.green,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 16.0, 32.0),
            child: Form(
              key: _formKeyAmount,
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Valor da Receita'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por favor, adicione a quantidade da sua receita.';
                  }
                },
              ),
            ),
          ),
          preferredSize: Size(0.0, 80.0),
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
                        hintText: 'Descreva o que você recebeu'),
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
    );
  }
}
