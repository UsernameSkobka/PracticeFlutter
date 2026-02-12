import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/app_data.dart';
import 'package:flutter_application_9/app_dataprovider.dart';
import 'package:flutter_application_9/inherited_page.dart';
import 'package:flutter_application_9/inherited_widget.dart';
import 'package:flutter_application_9/provider_page.dart';
import 'package:flutter_application_9/stateful.dart';
import 'package:flutter_application_9/util.dart';
import 'package:provider/provider.dart';
void main() {
  /*runApp(AppDataProvider(
    appData: AppData(
      backgroundColor: Util.randomColor(), 
      color: ValueNotifier<Color>(Util.randomColor()),
    ),
    child: MaterialApp(
        routes: {
          '/': (context) => const InheritedPage(),
          '/second': (context) => const InheritedPage()
        },
    )
  ));*/

  runApp(ChangeNotifierProvider(
    create: (context) => AppData(
      backgroundColor: Util.randomColor()
    ),
    child: MaterialApp(
        routes: {
          '/': (context) => const ProviderPage(),
          '/second': (context) => const ProviderPage()
        },
    )
  ),);
}