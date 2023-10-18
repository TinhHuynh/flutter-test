import 'package:flutter/material.dart';
import 'package:lesson_2/calculator.dart';

class TwoDigitOperation extends StatefulWidget {
  const TwoDigitOperation(
      {super.key, required this.operation, required this.calculator});
  final Operation operation;
  final Calculator calculator;

  @override
  State<TwoDigitOperation> createState() => _TwoDigitOperationState();
}

class _TwoDigitOperationState extends State<TwoDigitOperation> {
  double? operand1;
  double? operand2;
  double? result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  key: Key('operand_1_${widget.operation.val}'),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter operand',
                  ),
                  onChanged: (s) async {
                    operand1 = double.tryParse(s);
                    await calculate();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.operation.val,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                child: TextField(
                  key: Key('operand_2_${widget.operation.val}'),
                  decoration: const InputDecoration(
                    hintText: 'Enter operand',
                  ),
                  onChanged: (s) async {
                    operand2 = double.tryParse(s);
                    await calculate();
                  },
                ),
              ),
            ],
          ),
          Row(children: [
            const Text(
              '=',
              style: TextStyle(fontSize: 24),
            ),
            AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: result == null ? 0 : 1,
                child: Text(result == null ? '' : result.toString()))
          ])
        ],
      ),
    );
  }

  Future<void> calculate() async {
    if (operand1 == null || operand2 == null) {
      setState(() {
        result = null;
      });
      return;
    }
    setState(() {
      switch (widget.operation) {
        case Operation.add:
          result = widget.calculator.add(operand1!, operand2!);
          break;
        case Operation.subtract:
          result = widget.calculator.substract(operand1!, operand2!);
          break;
        case Operation.multiply:
          result = widget.calculator.multiply(operand1!, operand2!);
          break;
        case Operation.divide:
          result = widget.calculator.divide(operand1!, operand2!);
          break;
      }
    });
  }
}

enum Operation {
  add('+'),
  subtract('-'),
  multiply('*'),
  divide('/');

  final String val;
  const Operation(this.val);
}
