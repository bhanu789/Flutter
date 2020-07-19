// DicePage where both dice changes on clicking any one of the dice
// we are using images and containers to show dice.
//
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dicee"),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ));
  }
}

class DicePage extends StatefulWidget {
  DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  void changestate() {
    leftDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            child: Image.asset('images/dice$leftDice.png'),
            onPressed: () {
              setState(() {
                changestate();
              });
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              setState(() {
                changestate();
              });
            },
            child: Image.asset('images/dice$rightDice.png'),
          ),
        )
      ],
    );
  }
}
