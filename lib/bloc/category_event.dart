import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/category.dart';

///Category events to CategoryBloc
abstract class CategoryEvent extends Equatable {}

///Event to fetch categories
class FetchCategory extends CategoryEvent {}

///Event to add a category
class AddCategory extends CategoryEvent {
  ///Parameter
  final Category category;

  ///Constructor
  AddCategory({@required this.category});
}

///Event to update a category
class UpdateCategory extends CategoryEvent {
  ///Parameter
  final Category category;

  ///Constructor
  UpdateCategory({@required this.category});
}

///Event to delete a category
class DeleteCategory extends CategoryEvent {
  ///Parameter
  final Category category;

  ///Constructor
  DeleteCategory({@required this.category});
}
