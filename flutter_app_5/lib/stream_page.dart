import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  int _counter = 0;
  final StreamController<int> _controller = StreamController<int>();

  Stream<int> get counterUpdates => _controller.stream;

  late final Timer timer;

  void incrementCounter() {
    _counter++;
    _controller.add(_counter);
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      incrementCounter();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: counterUpdates,
            builder: (context, snapshot) {
              return Text(
                snapshot.data?.toString() ?? "",
                style: TextStyle(fontSize: 22),
              );
            },
          ),
        ),
      ),
    );
  }
}