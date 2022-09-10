import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 40),
          textStyle: TextStyle(fontSize: 24),
          side: BorderSide(width: 3, color: Colors.blueAccent),
          primary: Colors.blue,
          onPrimary: Colors.black,
        ),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
