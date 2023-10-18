import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_2/main.dart';
import 'package:lesson_2/two_digit_operation.dart';

void main() {
  group('Calculator App', () {
    testWidgets('match golden files', (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      expectLater(
          find.byType(MyHomePage), matchesGoldenFile('golden/my_app.png'));
    }, tags: 'no-ci');
    testWidgets('renders 4 widgets of type TwoDigitOperation',
        (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('show result when given two numbers', (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      final topTextFieldFinder = find.byKey(const Key('operand_1_+'));
      final bottomTextFieldFinder = find.byKey(const Key('operand_2_+'));

      await widgetTester.ensureVisible(topTextFieldFinder);
      await widgetTester.tap(topTextFieldFinder);
      await widgetTester.enterText(topTextFieldFinder, '3');

      await widgetTester.ensureVisible(bottomTextFieldFinder);
      await widgetTester.tap(bottomTextFieldFinder);
      await widgetTester.enterText(bottomTextFieldFinder, '6');

      await widgetTester.pumpAndSettle();
      expect(find.text('9.0'), findsOneWidget);
    });
  });
}
