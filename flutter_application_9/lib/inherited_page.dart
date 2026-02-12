/*import 'package:flutter/material.dart';
import 'package:flutter_application_9/app_dataprovider.dart';
import 'package:flutter_application_9/util.dart';

class InheritedPage extends StatefulWidget {
  const InheritedPage({super.key});

  @override
  State<InheritedPage> createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
  @override
  Widget build(BuildContext context) {
    var data = AppDataProvider.of(context);//context.dependOnInheritedWidgetOfExactType<AppDataProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Center(
        child: ValueListenableBuilder(
          valueListenable: data!.appData.color, 
          builder: (context, color, child) {
            return Container(
              width: 200,
              height: 200,
              color: color,
              child: Column(
                children: [
                  Text(data?.appData.backgroundColor.toString() ?? ''),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data?.appData.changeBackground(Util.randomColor());
                      });
                    }, 
                    child: const Text('Second Page')
                  )
                ],
              ),
            );
          }
        )
        
      )),
    );
  }
}*/