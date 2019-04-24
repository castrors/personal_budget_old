import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_budget/widget/category_colors_widget.dart';

void main() {
  testWidgets('given category colors widget when is created then should have same key', (tester) async {
    final colorsKey = GlobalKey<CategoryColorsWidgetState>();
    final widget = provideMaterialApp(CategoryColorsWidget(key: colorsKey, category: null));
    await tester.pumpWidget(widget);

    final widgetFinder = find.byKey(colorsKey);
  
    expect(widgetFinder, findsOneWidget);
  });

    testWidgets('given category colors widget when is created then should have no selection', (tester) async {
    final colorsKey = GlobalKey<CategoryColorsWidgetState>();
    final widget = provideMaterialApp(CategoryColorsWidget(key: colorsKey, category: null));
    await tester.pumpWidget(widget);

    final state = tester.state<CategoryColorsWidgetState>(find.byType(CategoryColorsWidget));
    
    expect(state.getSelectedColor, Colors.white.value);
  });


}

Widget provideMaterialApp(Widget widget) {
  return MaterialApp(home: Scaffold(body: Form(child: widget)));
}
