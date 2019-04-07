import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/category.dart';

abstract class CategoryEvent extends Equatable {}

class FetchCategory extends CategoryEvent {}

class AddCategory extends CategoryEvent {
  final Category category;

  AddCategory({@required this.category});
}

class UpdateCategory extends CategoryEvent {
  final Category category;

  UpdateCategory({@required this.category});
}

class DeleteCategory extends CategoryEvent {
  final Category category;

  DeleteCategory({@required this.category});
}
