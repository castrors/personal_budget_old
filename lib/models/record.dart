import 'package:equatable/equatable.dart';
import 'package:personal_budget/models/category.dart';

class Record extends Equatable {
  final int id;
  final double amount;
  final String description;
  final Category category;
  final DateTime date;
  final bool isExpense;

  Record(
      {this.id,
      this.amount,
      this.description,
      this.category,
      this.date,
      this.isExpense})
      : super([id, amount, description, category, date, isExpense]);

  factory Record.fromJson(Map<String, dynamic> data) => Record(
      id: data['id'],
      amount: data['amount'],
      description: data['description'],
      category: Category(id:data['category_id'], title: data['title'], color: data['color']),
      date: DateTime.fromMicrosecondsSinceEpoch(data['date']),
      isExpense: data['is_expense'] == 1);

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'description': description,
        'category_id': category.id,
        'date': date,
        'is_expense': isExpense,
      };

  Record clone(int id) => Record(
      id: id,
      amount: amount,
      description: this.description,
      category: this.category,
      date: this.date,
      isExpense: this.isExpense);
}
