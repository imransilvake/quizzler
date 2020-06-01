import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/classes/quiz.class.dart';

class QuestionWidget extends StatefulWidget {
  final Quiz quiz;

  QuestionWidget({this.quiz});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            widget.quiz.getQuestionText(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
