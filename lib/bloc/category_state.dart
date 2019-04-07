import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:personal_budget/models/category.dart';

abstract class CategoryState extends Equatable {
  CategoryState([List props = const []]) : super(props);
}

class CategoryEmpty extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({@required this.categories})
      : assert(categories != null),
        super([categories]);
}

class CategorySaved extends CategoryState {
  final Category category;

  CategorySaved({@required this.category})
      : assert(category != null),
        super([category]);
}

class CategoryDeleted extends CategoryState {
  final Category category;

  CategoryDeleted({@required this.category})
      : assert(category != null),
        super([category]);
}

class CategoryError extends CategoryState {}
