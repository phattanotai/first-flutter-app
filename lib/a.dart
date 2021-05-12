import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter First Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


String randomNumber() {
  var rng = new Random();
  String num = rng.nextInt(100).toString();
  return num;
}

class _MyHomePageState extends State<MyHomePage> {
  final textFieldController = TextEditingController();
  int _counter = 0;
  String _result = "เดาตัวเลข";
  String _answer = randomNumber();


  void _guessNumber() {
    setState(() {
      if (_answer == textFieldController.text) {
        _result = "สุดยอด!";
      } else {
        _result = "ผิด! คำตอบคือ:" + _answer;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: textFieldController,
            ), 
            Text(
              '$_result',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
           

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _guessNumber,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
