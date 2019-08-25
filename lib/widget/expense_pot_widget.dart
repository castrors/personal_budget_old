import 'package:flutter/material.dart';

class ExpensePot extends StatelessWidget {
  const ExpensePot({
    Key key,
    @required this.amount,
    @required this.label,
    this.onChangeCallback,
  }) : super(key: key);

  final int amount;
  final String label;
  final Function onChangeCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(label),
        Slider(
            value: amount.toDouble(),
            min: 0,
            max: 100,
            divisions: 20,
            label: '${amount.floor()}%',
            onChanged: onChangeCallback),
      ],
    );
  }
}
