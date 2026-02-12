import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_4/column_demo.dart';
import 'package:flutter_application_4/container_demo.dart';
import 'package:flutter_application_4/listView_demo.dart';
import 'package:flutter_application_4/row_demo.dart';
import 'package:flutter_application_4/stack_demo.dart';
import 'package:flutter_application_4/wrap_demo.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app UI',
      home: Center(child: WrapDemo()),
    );
  }
}
class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app UI',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: ((context, constraints) {
            return Row(
              children: [
                if (constraints.maxWidth > 800) ...[
                  Container(width: 200, height: 200, color: Colors.amber),
                  Container(width: 200, height: 200, color: Colors.blueAccent),
                ] else
                  Container(width: 300, height: 300, color: Colors.amber),
              ],
            );
          }),
        ),
      ),
    );
  }
}