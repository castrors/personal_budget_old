import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';

///Record data
class RecordData {
  ///record amount
  double amount;
  ///record description
  String description;
  ///category related
  Category category;
  ///record date
  DateTime date;
  
  ///Convert to a persistent model
  Record toPersistentModel({bool isExpense}) {
    return Record(
        amount: amount,
        description: description,
        category: category,
        date: date,
        isExpense: isExpense);
  }
}
