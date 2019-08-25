// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:personal_budget/models/record.dart';
// import 'package:personal_budget/widget/amount_widget.dart';

// void main() {
//   testWidgets('given amount widget when isExpense is true then should find Valor da Despesa', (tester) async {
//     final widget = provideMaterialApp(
//         AmountWidget(record: Record(), data: RecordData(), isExpense: true));
//     await tester.pumpWidget(widget);

//     final labelFinder = find.text('Valor da Despesa');

//     expect(labelFinder, findsOneWidget);
//   });

//   testWidgets('given amount widget when isExpense is false then should find Valor da Receita', (tester) async {
//     final widget = provideMaterialApp(
//         AmountWidget(record: Record(), data: RecordData(), isExpense: false));
//     await tester.pumpWidget(widget);

//     final labelFinder = find.text('Valor da Receita');

//     expect(labelFinder, findsOneWidget);
//   });

//   testWidgets('given amount widget when record amount is 20 then should find R\$20.0', (tester) async {
//     final widget = provideMaterialApp(
//         AmountWidget(record: Record(amount: 20.0), data: RecordData(), isExpense: false));
//     await tester.pumpWidget(widget);

//     final labelFinder = find.text('20.0');
//     final prefixFinder = find.text('R\$ ');

//     expect(labelFinder, findsOneWidget);
//     expect(prefixFinder, findsOneWidget);
//   });
// }

// Widget provideMaterialApp(Widget widget) {
//   return MaterialApp(home: Scaffold(body: Form(child: widget)));
// }
