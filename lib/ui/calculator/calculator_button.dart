import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String digit;
  Function onClick;

  CalculatorButton({required this.digit, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(12),
            child: ElevatedButton(
                onPressed: () {
                  onClick(digit);
                },
                child: Text(
                  digit,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                ))));
  }
}
