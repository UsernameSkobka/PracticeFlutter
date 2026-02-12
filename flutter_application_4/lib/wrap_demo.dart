import 'package:flutter/material.dart';
class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 16,
      runSpacing: 30,
      children: [
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          child: Center(child: Text("Cont1", textScaleFactor: 1)),
        ),
        Container(
          color: Colors.indigo,
          width: 200,
          height: 200,
          child: Center(child: Text("Cont1", textScaleFactor: 1)),
        ),
        Container(
          color: Colors.green,
          width: 200,
          height: 200,
          child: Center(child: Text("Cont1", textScaleFactor: 1)),
        ),
        Container(
          color: Colors.grey,
          width: 200,
          height: 200,
          child: Center(child: Text("Cont1", textScaleFactor: 1)),
        ),
      ],
    );
  }
}