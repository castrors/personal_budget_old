import 'package:flutter/material.dart';
import 'package:personal_budget/models/category_data.dart';
import 'package:personal_budget/widget/category_colors_widget.dart';

final colorsKey = new GlobalKey<CategoryColorsWidgetState>();
class CategoryDetail extends StatefulWidget {
  CategoryDetail({Key key}) : super(key: key);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  final _formKey = GlobalKey<FormState>();
  CategoryData _data = CategoryData();
  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.pop(context, _data.toPersistentModel(colorsKey.currentState.getSelectedColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Categoria'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            tooltip: 'Criar',
            onPressed: _submit,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Você pode criar categorias para os tipos de Despesas e Receitas que quiser registrar.',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300),
                  ),
                  TextFormField(
                    initialValue: "",
                    decoration: InputDecoration(hintText: 'Nome da categoria'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, selecione uma categoria da sua receita.';
                      }
                    },
                    onSaved: (String title) {
                      this._data.title = title;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('SELECIONE UMA COR PARA A CATEGORIA:'),
            Flexible(
              child: CategoryColorsWidget(key: colorsKey),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
