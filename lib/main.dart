import 'package:flutter/material.dart';
import 'package:personal_budget/data/category_repository_impl.dart';
import 'package:personal_budget/data/record_repository%20impl.dart';
import 'package:personal_budget/data/sqflite_database.dart';
import 'package:personal_budget/home.dart';
import 'package:personal_budget/models/category_data_provider.dart';
import 'package:personal_budget/models/record_data_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  final database = await SqfliteDatabase().createDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => CategoryDataProvider(
            CategoryRepositoryImpl(database),
          ),
        ),
        ChangeNotifierProvider(
          builder: (_) => RecordDataProvider(
            RecordRepositoryImpl(database),
          ),
        )
      ],
      child: Home(),
    ),
  );
}
