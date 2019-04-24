import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_budget/category/category_detail.dart';
import 'package:personal_budget/models/category.dart';
import 'package:personal_budget/widget/category_colors_widget.dart';

void main() {
  testWidgets(
      'given category detail widget when category is null then should show category form',
      (tester) async {
    final widget = provideMaterialApp(CategoryDetail(category: Category()));
    await tester.pumpWidget(widget);

    final nameFinder = find.text('Nome da categoria');

    expect(nameFinder, findsOneWidget);
    ;
  });

  testWidgets(
      'given category detail widget when category is not null then should show category form filled',
      (tester) async {
    final widget = provideMaterialApp(CategoryDetail(category: Category(title: 'Alimentação', color: 0xfff5a623)));
    await tester.pumpWidget(widget);

    final nameFinder = find.text('Alimentação');
    expect(nameFinder, findsOneWidget);  
    expect(find.byType(RadioItem), findsNWidgets(10));
    
  });

  testWidgets(
      'given category detail widget with category null when press save button then should show validation error',
      (tester) async {
    final widget = provideMaterialApp(CategoryDetail(category: Category()));
    await tester.pumpWidget(widget);

    await tester.tap(find.byIcon(Icons.check));
    await tester.pump();

    final categoryFinder = find.text('Por favor, nomeie a sua categoria.');

    expect(categoryFinder, findsOneWidget);
  });
}

Widget provideMaterialApp(Widget widget) {
  return MaterialApp(home: Scaffold(body: widget));
}
