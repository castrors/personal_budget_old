import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/models/record.dart';
import 'package:personal_budget/record/record_detail.dart';

void main() {
  testWidgets(
      'given record detail widget when record.isExpense is true then should show expense form',
      (tester) async {
    final widget = provideMaterialApp(RecordDetail(
        record: Record(isExpense: true), categories: provideCategories()));
    await tester.pumpWidget(widget);

    final amountFinder = find.text('Valor da Despesa');
    final descriptionFinder = find.text('Descreva o que você gastou');
    final dateFinder = find.text('Data');

    expect(amountFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(dateFinder, findsOneWidget);
  });

  testWidgets(
      'given record detail widget when record.isExpense is false then should show receipt form',
      (tester) async {
    final widget = provideMaterialApp(RecordDetail(
        record: Record(isExpense: false), categories: provideCategories()));
    await tester.pumpWidget(widget);

    final amountFinder = find.text('Valor da Receita');
    final descriptionFinder = find.text('Descreva o que você recebeu');
    final dateFinder = find.text('Data');

    expect(amountFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(dateFinder, findsOneWidget);
  });

  testWidgets(
      'given record detail widget when record.isExpense is false then should show receipt form',
      (tester) async {
    final widget = provideMaterialApp(RecordDetail(
        record: Record(isExpense: false), categories: provideCategories()));
    await tester.pumpWidget(widget);

    final amountFinder = find.text('Valor da Receita');
    final descriptionFinder = find.text('Descreva o que você recebeu');
    final dateFinder = find.text('Data');

    expect(amountFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(dateFinder, findsOneWidget);
  });
}

List<Category> provideCategories() {
  return [
    Category(id: 1, title: 'Category 1', color: Colors.red.value),
    Category(id: 2, title: 'Category 2', color: Colors.blue.value),
    Category(id: 3, title: 'Category 3', color: Colors.green.value),
  ];
}

Widget provideMaterialApp(Widget widget) {
  return MaterialApp(home: Scaffold(body: widget));
}
