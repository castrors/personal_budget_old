import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:personal_budget/data/category_repository.dart';
import 'package:personal_budget/models/category.dart';

class CategoryData extends ChangeNotifier {

  final CategoryRepository _repository;
  

  CategoryData(this._repository);


  Future<UnmodifiableListView<Category>> get categories async {
    var categories = await _repository.getCategories();
    return UnmodifiableListView(categories);
  }


  void updateCategory(Category category){
    _repository.updateCategory(category);
    notifyListeners();
  }


  void addCategory(Category category){
    _repository.addCategory(category);
    notifyListeners();
  }


  void deleteCategory(Category category) {
    _repository.deleteCategory(category);
    notifyListeners();
  }
}
