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

  testWidgets(
      'given record detail widget when record is valid then should show receipt form filled',
      (tester) async {
    final widget = provideMaterialApp(RecordDetail(
        record: Record(
            amount: 20.0,
            description: 'Desert',
            category: provideCategories().first,
            date: DateTime(2019, 4, 20),
            isExpense: true),
        categories: provideCategories()));
    await tester.pumpWidget(widget);

    final amountFinder = find.text('20.0');
    final descriptionFinder = find.text('Desert');
    final categoryFinder = find.text('CATEGORY 1');
    final dateFinder = find.text('2019-04-20');

    expect(amountFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(categoryFinder, findsOneWidget);
    expect(dateFinder, findsOneWidget);
  });

  testWidgets(
      'given record detail widget with record null when press save button then should show validation error',
      (tester) async {
    final widget = provideMaterialApp(RecordDetail(
        record: null, categories: provideCategories()));
    await tester.pumpWidget(widget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    final amountFinder = find.text('Por favor, adicione a quantidade da sua despesa.');
    final descriptionFinder = find.text('Por favor, crie uma descrição da sua despesa.');
    final dateFinder = find.text('Por favor, selecione a data da sua despesa.');

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
