import 'dart:math';

class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double substract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) throw ArgumentError('divide by zero');
    return a / b;
  }

  Future<double> powerOfTwo(double a) {
    return Future.delayed(
        const Duration(seconds: 1), () => pow(a, 2) as double);
  }

  Stream<double> pi() => Stream.fromIterable([3, 3.1, 3.14, 3.1415]);
}
