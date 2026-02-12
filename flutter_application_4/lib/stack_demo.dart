import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(width: 200, height: 200, color: Colors.lightGreenAccent),
        Container(width: 160, height: 160, color: Colors.cyan),
        Container(width: 100, height: 100, color: Colors.blue),
      ],
    );
  }
}