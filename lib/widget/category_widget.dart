import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/category_data_provider.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/models/record_data.dart';
import 'package:provider/provider.dart';

///Category Widget
class CategoryWidget extends StatefulWidget {
  ///Record
  final Record record;

  ///Record data
  final RecordData _data;

  ///Constructor
  CategoryWidget({
    Key key,
    @required this.record,
    @required RecordData data,
  })  : _data = data,
        super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  Category _currentCategory;

  List<DropdownMenuItem<Category>> getDropDownMenuItems(
      UnmodifiableListView<Category> categories) {
    return categories
        .map((category) => DropdownMenuItem(
            value: category,
            child: Text(
              category.title.toUpperCase(),
              style: TextStyle(color: Color(category.color)),
            )))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    if (widget.record != null) {
      var category = widget.record.category;
      if (category != null) {
        changedDropDownItem(category);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        icon: const Icon(Icons.category),
        labelText: 'Categoria',
      ),
      child: DropdownButtonHideUnderline(
        child: FutureBuilder<UnmodifiableListView>(
          future: Provider.of<CategoryDataProvider>(context).categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DropdownButton<Category>(
                value: _currentCategory,
                items: getDropDownMenuItems(snapshot.data),
                onChanged: changedDropDownItem,
              );
            }
          },
        ),
      ),
    );
  }

  void changedDropDownItem(Category selectedCategory) {
    setState(() {
      widget._data.category = selectedCategory;
      _currentCategory = selectedCategory;
    });
  }
}
