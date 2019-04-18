import 'package:equatable/equatable.dart';
import 'package:personal_budget/models/category.dart';

///Record model
class Record extends Equatable {
  ///record id
  final int id;

  ///record amount
  final double amount;

  ///record description
  final String description;

  ///category related
  final Category category;

  ///record date
  final DateTime date;

  ///record type
  final bool isExpense;

  ///Constructor
  Record(
      {this.id,
      this.amount,
      this.description,
      this.category,
      this.date,
      this.isExpense})
      : super([id, amount, description, category, date, isExpense]);

  ///Create a record from json
  factory Record.fromJson(Map<String, dynamic> data) => Record(
      id: data['record_id'],
      amount: data['amount'],
      description: data['description'],
      category: Category(
          id: data['category_id'], title: data['title'], color: data['color']),
      date: DateTime.fromMicrosecondsSinceEpoch(data['date']),
      isExpense: data['is_expense'] == 1);

  ///Convert a record to json
  Map<String, dynamic> toJson() => {
        'record_id': id,
        'amount': amount,
        'description': description,
        'category_id': category.id,
        'date': date,
        'is_expense': isExpense,
      };

  ///Create a copy of record replacing the id
  Record clone(int id) => Record(
      id: id,
      amount: amount,
      description: description,
      category: category,
      date: date,
      isExpense: isExpense);
}
