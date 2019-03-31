
import 'package:equatable/equatable.dart';

class Record extends Equatable {
  final double amount;
  final String description;
  final String category;
  final DateTime date;

  Record({
    this.amount,
    this.description,
    this.category,
    this.date
  }) : super ([
      amount,
      description,
      category,
      date
  ]);
}