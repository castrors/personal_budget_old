import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/category/category_detail.dart';
import 'package:personal_budget/main.dart';
import 'package:personal_budget/models/category.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryBloc _categoryBloc;

  void _navigateToCategoryDetail(Category category) async {
    final categoryResult = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryDetail(category: category),
      ),
    );

    if (categoryResult != null) {
      if (categoryResult.id != null) {
        _categoryBloc.dispatch(UpdateCategory(category: categoryResult));
      } else {
        _categoryBloc.dispatch(AddCategory(category: categoryResult));
      }
      _categoryBloc.dispatch(FetchCategory());
    }
  }

  @override
  Widget build(BuildContext context) {
    _categoryBloc = App.of(context).categoryBloc;
    _categoryBloc.dispatch(FetchCategory());
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
              child: BlocBuilder(
                bloc: _categoryBloc,
                builder: (_, CategoryState state) {
                  if (state is CategoryEmpty) {
                    return Center(child: Text('RecordEmpty'));
                  }
                  if (state is CategoryLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CategoryLoaded) {
                    final categories = state.categories;
                    return ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return provideListItem(categories[index]);
                        });
                  }
                  if (state is RecordError) {
                    return Center(child: Text('RecordError'));
                  }
                },
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _navigateToCategoryDetail(null);
          }),
    );
  }

  Widget provideListItem(Category category) {
    return Dismissible(
      key: Key(category.title),
      onDismissed: (direction) {
        _categoryBloc.dispatch(DeleteCategory(category: category));
        _categoryBloc.dispatch(FetchCategory());

        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("${category.title} removida com sucesso.")));
      },
      child: ListTile(
        title: Text(
          category.title.toUpperCase(),
          style: TextStyle(
              color: Color(category.color),
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        onTap: () {
          _navigateToCategoryDetail(category);
        },
      ),
    );
  }
}
