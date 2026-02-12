import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_5/stream_page.dart';

class User {
  int? age;
  String? name;

  //User({required this.age});
  User({this.age, this.name});
}

abstract class Person{
  final String name;
  final int age;
  final bool sex;
  //final String _lastname; //внутренняя переменная

  Person({required this.name, required this.age, required this.sex});
}

class Student extends Person {
  Student({required super.name, required super.age, required super.sex, required this.avgScore});
  final int avgScore;
}

class Man implements Person { //нажать Ctrl+. для добавления всех необходимых геттеров
  @override
  final String name;
  @override
  final int age;

  Man({required this.name, required this.age});

  @override
  // TODO: implement sex
  bool get sex => true;
}

extension ManExtension on Man {
  bool get isOld{
    if (age>65) {
      return true;
    } else {
      return false;
    }
  }
}


void main() {
  // baseExample();
  //nullSafetyExample();
  //oopExample();
  //collectionsExample();
  //recordsExample();
  //asyncExample();
  //streamExample();
  //runApp(const StreamPage());
  //generatorsExample();
  
}

const count = 5;
void baseExample() {
  print ('count = $count');

  var countVar = 5;
  countVar++;
  print('countVar = ${countVar.runtimeType}');
  print('countVar = $countVar');

  final List<int> list = [];
  list.add(1);
  print(list);
}

void nullSafetyExample() {
  int? count = 5;
  count = null;
  int num2 = count ?? 0;
  User? user;
  user?.age = 5;

  //print(count!);
  print(num2);
  print(user?.age);

  User? user1;
  user
    ?..age = 5
    ..name = '';
  
  late final int count1; //отложенное присваивание значения

  count1 = 5;

  Never valueIsNotDefined() {
    throw ArgumentError('Value is not defined');
  }

  int method(int? value) {
    if (value == null) {
      return valueIsNotDefined(); //редкий способ, проще сразу выкинуть ошибку
    }
    return value;
  }

  method(null);
}

void oopExample() {
  Person p = Student(name: 'Kimi', age: 19, sex: false, avgScore: 5);
  Man man = Man(name: 'Man', age: 66);

  print(p);
  print(man.isOld);
}

void collectionsExample() {
  //final list = ['Item1', 'Item2', 'Item3', 5]; //непараметризованный список
  final list = <String>['Item1', 'Item2', 'Item3']; //параметризованный список
  //final list1 = List<String>.empty(); //создание пустого списка через конструктор.
  final list1 = List<String>.empty(growable: true); //для добавления знаечений нужен параметр growable взначении true 

  list1.add('Item1'); //добавляем значения в list1

  print(list);
  print(list1);

  final map = { //map - хранилище ключей
    'key1': 'value1',
  };

  print(map['key1']);
}

void recordsExample() {
  var item = ("Name", 30);
  print(item.$1);

  (String, int, int) item2 = ('Name2', 3,3);
  print(item2);

  var item3 = (name: 'Name3', age: 5); //в выводе поля сортируются по алфавиту
  //({String name, int age}) item3 = (name: 'Name3', age: 5); //вариант с нужным нам выводом по порядку - перепроверить
  print(item3.name);
}

void asyncExample() {
  final future = Future<String>(() async {
    return 'String';
  });

  //future.then(value) {
  //  print(value);
  //};
}

void streamExample() async { // конвеер/ассинхронный список
  var controller = StreamController<String>(); // создание контроллера (кладет данные)

  final subscription = controller.stream.listen((event) { // данные забирает
    print(event);
  });

  await Future.delayed(const Duration(seconds: 1));
  controller.add('String1');
  await Future.delayed(const Duration(seconds: 1));
  controller.add('String2');
  await Future.delayed(const Duration(seconds: 1));
  subscription.cancel();
}

void generatorsExample() async {
  print(naturalsTo(5).take(3));

}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) {
    await Future.delayed(const Duration(seconds: 1));
    yield k++;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
