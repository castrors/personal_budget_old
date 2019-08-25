import 'package:flutter/material.dart';
import 'package:personal_budget/data/category_repository.dart';
import 'package:personal_budget/data/sqflite_database.dart';
import 'package:personal_budget/home.dart';

import 'package:personal_budget/data/record_repository.dart';
import 'package:personal_budget/models/category_data_provider.dart';
import 'package:personal_budget/models/record_data_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  final database = await SqfliteDatabase().createDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            builder: (_) => CategoryDataProvider(CategoryRepository(database))),
        ChangeNotifierProvider(
            builder: (_) => RecordDataProvider(RecordRepository(database)))
      ],
      child: Home(),
    ),
  );
}
