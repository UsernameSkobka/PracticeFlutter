import 'package:flutter/material.dart';
import 'package:flutter_application_9/app_data.dart';
class AppDataProvider extends InheritedWidget {
  final AppData appData;
  
  const AppDataProvider({required this.appData, required super.child, super.key,});
  
  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}