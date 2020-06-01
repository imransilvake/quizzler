import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/classes/quiz.class.dart';

class ButtonWidget extends StatefulWidget {
  final bool isSelectedTrue;
  final String buttonText;
  final Color buttonColor;
  final Quiz quiz;
  final Function(bool) notifyParent;

  ButtonWidget({
    this.notifyParent,
    this.isSelectedTrue,
    this.buttonText,
    this.buttonColor,
    this.quiz,
  });

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: widget.buttonColor,
          child: Text(
            widget.buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            widget.notifyParent(widget.isSelectedTrue);
          },
        ),
      ),
    );
  }
}
