import 'package:personal_budget/models/record.dart';

class RecordData {
  double amount;
  String description;
  String category;
  DateTime date;

  Record toPersistentModel(bool isExpense) {
    return Record(
        amount: this.amount,
        description: this.description,
        category: this.category,
        date: this.date,
        isExpense: isExpense);
  }
}
