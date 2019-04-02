import 'package:equatable/equatable.dart';

class Record extends Equatable {
  final int id;
  final double amount;
  final String description;
  final String category;
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
      id: data["id"],
      amount: data["amount"],
      description: data["description"],
      category: data["category"],
      date: DateTime.fromMicrosecondsSinceEpoch(data["date"]),
      isExpense: data["is_expense"] == 1);

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "description": description,
        "category": category,
        "date": date,
        "is_expense": isExpense,
      };
}
