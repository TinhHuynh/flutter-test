import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_2/calculator.dart';
import 'package:lesson_2/two_digit_operation.dart';
import 'package:mockito/mockito.dart';

import 'package:mockito/annotations.dart';

@GenerateMocks([Calculator])
import 'two_digit_operation_test.mocks.dart';

void main() {
  late Calculator calculator;
  setUp(() {
    calculator = MockCalculator();
  });

  testWidgets('test two digit operation ', (widgetTester) async {
    when(calculator.add(3, 1)).thenReturn(25);
    await widgetTester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: TwoDigitOperation(operation: Operation.add, calculator: calculator),
    )));
    await widgetTester.enterText(find.byKey(const Key('operand_1_+')), '3');
    await widgetTester.enterText(find.byKey(const Key('operand_2_+')), '1');

    await widgetTester.pumpAndSettle();
    expect(find.text("25.0"), findsOneWidget);
    verify(calculator.add(3, 1)).called(1);
  });
}
