import 'package:flutter/material.dart';
class AppData with ChangeNotifier {
  Color backgroundColor;

  //ValueNotifier<Color> color;

  AppData({required this.backgroundColor/*, required this.color*/});
  
  void changeBackground(Color newColor) {
    backgroundColor = newColor;
    notifyListeners();
  }
}