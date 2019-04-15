
import 'package:flutter/material.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';

Record recordOne = Record(
  amount: 10.0,
  category: categoryOne,
  date: DateTime.now(),
  description: 'Registro um',
  id: 1,
  isExpense: false,
  );

Category categoryOne = Category(
  color: Colors.red.value,
  id: 1,
  title: 'Categoria Um'
);