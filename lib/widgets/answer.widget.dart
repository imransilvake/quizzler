import 'package:flutter/cupertino.dart';
import 'package:quizzler/classes/quiz.class.dart';

class AnswerWidget extends StatefulWidget {
  final Quiz quiz;

  AnswerWidget({this.quiz});

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(children: widget.quiz.getAllScores()),
    );
  }
}
