import 'package:flutter/material.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/widget/category_colors_widget.dart';

final GlobalKey<CategoryColorsWidgetState> colorsKey =
    GlobalKey<CategoryColorsWidgetState>();

class CategoryDetail extends StatelessWidget {
  final Category category;

  CategoryDetail({this.category});

  void _submit(BuildContext context, String title) {
    if (title.isNotEmpty) {
      Navigator.pop(
          context,
          category.clone(category != null ? category.id : null, title,
              colorsKey.currentState.getSelectedColor));
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: category.title);
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Categoria'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check),
              tooltip: 'Criar',
              onPressed: () {
                _submit(context, controller.text);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Você pode criar categorias para os tipos de\nDespesas e Receitas que quiser registrar.',
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
            ),
            TextField(
              autofocus: true,
              controller: controller,
              onChanged: (currentText) {
                controller.text = currentText;
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text('SELECIONE UMA COR PARA A CATEGORIA:'),
            Expanded(
              child: CategoryColorsWidget(key: colorsKey, category: category),
            )
          ],
        ),
      ),
    );
  }
}
