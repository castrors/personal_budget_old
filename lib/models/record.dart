
import 'package:equatable/equatable.dart';

class Record extends Equatable {
  final double amount;
  final String description;
  final String category;
  final DateTime date;
  final bool isExpense;

  Record({
    this.amount,
    this.description,
    this.category,
    this.date,
    this.isExpense
  }) : super ([
      amount,
      description,
      category,
      date,
      isExpense
  ]);
}