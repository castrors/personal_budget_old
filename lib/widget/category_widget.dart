import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/main.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    Key key,
    @required this.record,
    @required RecordData data,
  })  : _data = data,
        super(key: key);

  final Record record;
  final RecordData _data;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  CategoryBloc _categoryBloc;

  String _currentCity = "";

  List<DropdownMenuItem<String>> getDropDownMenuItems(
      List<Category> categories) {
  
    return categories
        .map((category) => DropdownMenuItem(
            value: category.title, child: new Text(category.title)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    _categoryBloc = App.of(context).categoryBloc;
    _categoryBloc.dispatch(FetchCategory());

    return BlocBuilder(
        bloc: _categoryBloc,
        builder: (_, CategoryState state) {
          if (state is CategoryLoaded) {
            return FormField(builder: (FormFieldState formState) {
              return InputDecorator(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.category),
                    labelText: 'Categoria',
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                    value: _currentCity,
                    items: getDropDownMenuItems(state.categories),
                    onChanged: changedDropDownItem,
                  )));
            });
          }
          if (state is CategoryEmpty) {
            return Text('CategoryEmpty');
          }
          if (state is CategoryError) {
            return Text('CategoryError');
          }
          if (state is CategoryLoading) {
            return CircularProgressIndicator();
          }
        });
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
