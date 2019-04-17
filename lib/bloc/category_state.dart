import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/category.dart';

///CategoryState is a result to CategoryEvents
abstract class CategoryState extends Equatable {
  ///Cosntructor
  CategoryState([List props = const []]) : super(props);
}

///Result when there is no categories
class CategoryEmpty extends CategoryState {}

///Result when is loading the categories
class CategoryLoading extends CategoryState {}

///Result when categories are loaded
class CategoryLoaded extends CategoryState {
  ///Result data
  final List<Category> categories;

  ///Constructor
  CategoryLoaded({@required this.categories})
      : assert(categories != null),
        super([categories]);
}

///Result when a catecory is saved with success
class CategorySaved extends CategoryState {
  ///Result data
  final Category category;

  ///Constructor
  CategorySaved({@required this.category})
      : assert(category != null),
        super([category]);
}

///Result when a category is deleted with success
class CategoryDeleted extends CategoryState {
  ///Result data
  final Category category;

  ///Constructor
  CategoryDeleted({@required this.category})
      : assert(category != null),
        super([category]);
}

///Result when an error occurs
class CategoryError extends CategoryState {}
