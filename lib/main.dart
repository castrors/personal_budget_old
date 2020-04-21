import 'package:flutter/material.dart';
import 'package:personal_budget/data/category_repository_impl.dart';
import 'package:personal_budget/data/record_repository_impl.dart';
import 'package:personal_budget/data/sqflite_database.dart';
import 'package:personal_budget/home.dart';
import 'package:personal_budget/models/category_data.dart';
import 'package:personal_budget/models/record_data.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await SqfliteDatabase().createDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryData(
            CategoryRepositoryImpl(database),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => RecordData(
            RecordRepositoryImpl(database),
          ),
        )
      ],
      child: Home(),
    ),
  );
}
