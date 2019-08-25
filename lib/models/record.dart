import 'package:equatable/equatable.dart';
import 'package:personal_budget/models/category.dart';

class Record extends Equatable {
  int id;
  double amount;
  String description;
  Category category;
  DateTime date;
  bool isExpense;

  Record(
      {this.id,
      this.amount,
      this.description,
      this.category,
      this.date,
      this.isExpense = true})
      : super([id, amount, description, category, date, isExpense]);

  factory Record.fromJson(Map<String, dynamic> data) => Record(
      id: data['record_id'],
      amount: data['amount'],
      description: data['description'],
      category: Category(
          id: data['category_id'], title: data['title'], color: data['color']),
      date: DateTime.fromMicrosecondsSinceEpoch(data['date']),
      isExpense: data['is_expense'] == 1);

  Map<String, dynamic> toJson() => {
        'record_id': id,
        'amount': amount,
        'description': description,
        'category_id': category.id,
        'date': date,
        'is_expense': isExpense,
      };
}
