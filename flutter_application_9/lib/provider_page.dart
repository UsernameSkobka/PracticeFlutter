import 'package:flutter/material.dart';
import 'package:flutter_application_9/app_data.dart';
import 'package:flutter_application_9/util.dart';
import 'package:provider/provider.dart';
class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});
  @override
  State<ProviderPage> createState() => _ProviderPageState();
}
class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            color: context.watch<AppData>().backgroundColor,
            child: Column(
              children: [
                Text(context.watch<AppData>().backgroundColor.toString()),
                ElevatedButton(
                  onPressed: () {
                    context.read<AppData>().changeBackground(Util.randomColor());
                  },
                  child: Text("Color"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/second");
                  },
                  child: Text("Second"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}