import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_2/calculator.dart';

void main() {
  late Calculator calculator;
  setUp(() {
    return calculator = Calculator();
  });

  test('test create calculator', () {
    expect(calculator, isNotNull);
  });
  group('test add', () {
    test("the calculator returns 4 when adding 2 and 2", () {
      expect(calculator.add(2, 2), 4);
    });
    test("the calculator returns 1 when adding 0 and 1", () {
      expect(calculator.add(1, 0), 1);
    });
  });
  group('test divide', () {
    test("the calculator returns 5 when divide 10 to 2", () {
      expect(calculator.divide(10, 5), 2);
    });
    test("the calculator throw ArgumentErro when divide 10 to 0", () {
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });
  });
  group('test power of 2', () {
    test('the calculator returns 9 when power of 2 for 3',
        () async => expect(await calculator.powerOfTwo(3), 9));
  });

  group('test pi', () {
    test('the calculator returns 3, 3.1, 3.14, 3.1415',
        () => expect(calculator.pi(), emitsInOrder([3, 3.1, 3.14, 3.1415])));
  });
}
