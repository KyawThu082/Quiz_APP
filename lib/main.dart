import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/results.dart';

import './quiz.dart';
import './results.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp()); //Same as above

class MyApp extends StatefulWidget {
  @override // This is decorator.
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
} // This is Widgets.

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': '1. What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': '2. What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'questionText': '3. What\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Julia', 'score': 5},
        {'text': 'Angela', 'score': 3},
        {'text': 'Scarlet', 'score': 1},
      ],
    },
    {
      'questionText': '4. What\'s your favorite fruit?',
      'answers': [
        {'text': 'Apple', 'score': 10},
        {'text': 'Dragonfruit', 'score': 5},
        {'text': 'Pineapple', 'score': 3},
        {'text': 'Orange', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more question!');
    }
  } // This is interanl State

  @override //this is decorator of dart.
  Widget build(BuildContext context) {
    //var dummy = const ['Hello'];
    //dummy.add('Max');
    //print(dummy);
    //dummy = [];

    // questions = []; does not work in const if question is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: (_questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz)),
      ),
    );
  }
}
