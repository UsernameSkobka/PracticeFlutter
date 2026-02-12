import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(width: 100, height: 100, color: Colors.pink),
        ),
        Expanded(
          flex: 2,
          child: Container(width: 100, height: 100, color: Colors.green),
        ),
        Expanded(
          flex: 1,
          child: Container(width: 100, height: 100, color: Colors.red),
        ),
      ],
    );
  }
}