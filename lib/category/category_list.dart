import 'package:flutter/material.dart';
import 'package:personal_budget/category/category_detail.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> _list = ['Alimentação', 'Educação', 'Financeiro'];

void _navigateToCategoryDetail() async {
  final categoryResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetail(),
      ),
    );
    if (categoryResult != null) {
        // _recordBloc.dispatch(AddRecord(record: recordResult));
        // _recordBloc.dispatch(FetchRecord());
    }
}

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
        onPressed: _navigateToCategoryDetail,
      ),
    );
  }
}
