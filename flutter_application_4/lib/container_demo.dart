import 'dart:math';
import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 300,
      height: 300,
      constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
      padding: EdgeInsets.all(30),
      child: Container(
        transform: Matrix4.skewY(0.3)..rotateZ(pi / 12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.yellowAccent, offset: Offset(-20, -20)),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [Colors.pink, Colors.purple]),
        ),
      ),
    );
  }
}