import 'package:flutter/material.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';

class CategoryWidget extends StatefulWidget {
  final Record record;
  final RecordData _data;
  final List<Category> categories;

  CategoryWidget({
    Key key,
    @required this.record,
    @required RecordData data,
    @required this.categories,
  })  : _data = data,
        super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String _currentCategory;

  List<DropdownMenuItem<String>> getDropDownMenuItems(
      List<Category> categories) {
    return categories
        .map((category) => DropdownMenuItem(
            value: category.title, child: new Text(category.title)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState formState) {
        return InputDecorator(
            decoration: InputDecoration(
              icon: const Icon(Icons.category),
              labelText: 'Categoria',
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
              value: _currentCategory,
              items: getDropDownMenuItems(widget.categories),
              onChanged: changedDropDownItem,
            )));
      },
      onSaved: (String category) {
        widget._data.category = category;
      },
    );
  }

  void changedDropDownItem(String selectedCategory) {
    setState(() {
      _currentCategory = selectedCategory;  
    });
  }
}
