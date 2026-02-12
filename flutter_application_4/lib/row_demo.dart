import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(width: 100, height: 100, color: Colors.pink),
        Container(width: 100, height: 100, color: Colors.green),
        Container(width: 100, height: 100, color: Colors.red),
      ],
    );
  }
}