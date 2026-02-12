import 'package:flutter/material.dart';
import 'package:flutter_application_10/bloc/color_bloc.dart';
import 'package:flutter_application_10/bloc_page.dart';
import 'package:flutter_application_10/cubit_page.dart';
final colorBloc = ColorBloc();
void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => CubitPage(),
        "/second": (context) => CubitPage(),
      },
    ),
  );
}