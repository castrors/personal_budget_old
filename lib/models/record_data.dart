import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';

class RecordData {
  double amount;
  String description;
  Category category;
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
