import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> _list = ['Alimentação', 'Educação', 'Financeiro'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
              flex: 1,
              child: Container(
                color: Color(0xfff3f3f3),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Clique sobre a categoria para poder editar ou deletar a mesma.',
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w200),
                ),
              )),
          Flexible(
            flex: 3,
            child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _list[index].toUpperCase(),
                      style: TextStyle(
                          color: index % 2 == 0
                              ? Colors.indigo
                              : Colors.orangeAccent),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
