import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lesson_2/main.dart';

void main() {
  // group('add', () {
  //   testWidgets('show result when given two numbers', (widgetTester) async {
  //     await widgetTester.pumpWidget(const MyApp());
  //     final topTextFieldFinder = find.byKey(const Key('operand_1_+'));
  //     final bottomTextFieldFinder = find.byKey(const Key('operand_2_+'));

  //     await widgetTester.ensureVisible(topTextFieldFinder);
  //     await widgetTester.tap(topTextFieldFinder);
  //     await widgetTester.enterText(topTextFieldFinder, '3');

  //     await widgetTester.ensureVisible(bottomTextFieldFinder);
  //     await widgetTester.tap(bottomTextFieldFinder);
  //     await widgetTester.enterText(bottomTextFieldFinder, '6');

  //     await widgetTester.pumpAndSettle();
  //     expect(find.text('9.0'), findsOneWidget);
  //   });
  // });

  group('screenshot add', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('show result when given two numbers', (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      await widgetTester.pumpAndSettle();

      final topTextFieldFinder = find.byKey(const Key('operand_1_+'));
      final bottomTextFieldFinder = find.byKey(const Key('operand_2_+'));

      await widgetTester.ensureVisible(topTextFieldFinder);
      await widgetTester.tap(topTextFieldFinder);
      await widgetTester.enterText(topTextFieldFinder, '3');

      await widgetTester.ensureVisible(bottomTextFieldFinder);
      await widgetTester.tap(bottomTextFieldFinder);
      await widgetTester.enterText(bottomTextFieldFinder, '6');
      await widgetTester.pumpAndSettle();

      await takeScreenshot(widgetTester, binding);
    });
  });
}

takeScreenshot(
    WidgetTester tester, IntegrationTestWidgetsFlutterBinding binding) async {
  if (kIsWeb) {
    await binding.takeScreenshot('test-screenshot');
    return;
  } else if (Platform.isAndroid) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
  }
  await binding.takeScreenshot('test-screenshot');
}
