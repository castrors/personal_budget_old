import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:personal_budget/bloc/blocs.dart';
import 'package:personal_budget/data/category_repository.dart';
import 'package:personal_budget/data/sqflite_database.dart';
import 'package:personal_budget/home.dart';

import 'package:personal_budget/data/record_repository.dart';
import 'package:personal_budget/simple_bloc_delegate.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final Database database = await SqfliteDatabase().createDatabase();
  final RecordBloc recordBloc =
      RecordBloc(recordRepository: RecordRepository(database: database));
  final CategoryBloc categoryBloc =
      CategoryBloc(categoryRepository: CategoryRepository(database: database));
  runApp(
      App(recordBloc: recordBloc, categoryBloc: categoryBloc, child: Home()));
}

class App extends InheritedWidget {
  final RecordBloc recordBloc;
  final CategoryBloc categoryBloc;

  App({@required this.recordBloc, @required this.categoryBloc, Widget child})
      : assert(recordBloc != null && categoryBloc != null),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static App of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(App);
}
