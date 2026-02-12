import 'dart:math';
import 'package:flutter/material.dart';
class Util {
  static Color rndColor() {
    return Color(Random().nextInt(0xffffffff));
  }
}