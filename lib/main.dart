import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/data/category_repository.dart';
import 'package:personal_budget/data/sqflite_database.dart';
import 'package:personal_budget/home.dart';

import 'package:personal_budget/data/record_repository.dart';
import 'package:personal_budget/simple_bloc_delegate.dart';

void main() async {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final database = await SqfliteDatabase().createDatabase();
  final recordBloc =
      RecordBloc(recordRepository: RecordRepository(database: database));
  final categoryBloc =
      CategoryBloc(categoryRepository: CategoryRepository(database: database));
  runApp(
      App(recordBloc: recordBloc, categoryBloc: categoryBloc, child: Home()));
}

///Root widget
class App extends InheritedWidget {
  ///RecordBloc
  final RecordBloc recordBloc;

  ///CategoryBloc
  final CategoryBloc categoryBloc;

  ///Constructor
  App({@required this.recordBloc, @required this.categoryBloc, Widget child})
      : assert(recordBloc != null && categoryBloc != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  ///Provides the instance of App
  static App of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(App);
}
