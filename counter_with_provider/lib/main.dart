import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter with Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Counter(),
            )
          ]),
    ));
  }
}

class CountData extends ChangeNotifier {
  int count = 5;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }
}

class Counter extends StatelessWidget {
  final data = CountData();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountData>.value(
        value: data,
        child: Container(
          child: ChildWidget(),
        ));
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountData data = context.watch<CountData>();
    return Column(
      children: <Widget>[
        Text(
          'counter is ${data.count.toString()}',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              data.increment();
            },
            child: Text('count up'),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              data.decrement();
            },
            child: Text('count down'),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              data.reset();
            },
            child: Text('reset'),
          ),
        ),
      ],
    );
  }
}
