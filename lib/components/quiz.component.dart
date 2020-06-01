import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/classes/quiz.class.dart';
import 'package:quizzler/models/score.model.dart';
import 'package:quizzler/widgets/answer.widget.dart';
import 'package:quizzler/widgets/button.widget.dart';
import 'package:quizzler/widgets/question.widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = new Quiz();

  /// update quiz state
  void updateQuizState(dynamic userSelectedOption) {
    setState(() {
      // validate quiz end
      if (!quiz.isQuizFinished()) {
        // validate user answer
        bool questionRealAnswer = quiz.getQuestionAnswer();
        bool result = questionRealAnswer == userSelectedOption;

        // add icon
        quiz.updateQuizScore(
          Score(
            result: result,
            icon: Icon(
              result ? Icons.check : Icons.close,
              color: result ? Colors.green : Colors.red,
            ),
          ),
        );

        // call next question
        quiz.nextQuestion();
      } else {
        // result
        int result = quiz.getQuizResult();

        // show message to the user
        Alert(
            type: AlertType.success,
            context: context,
            title: 'Quiz Finished!',
            desc: 'Your score is $result',
            style: AlertStyle(
              isCloseButton: false,
            ),
            buttons: [
              DialogButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
              )
            ]).show();

        // reset quiz
        quiz.resetQuiz();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        /// widget: question
        new QuestionWidget(quiz: quiz),

        /// widget: button
        new ButtonWidget(
          notifyParent: updateQuizState,
          isSelectedTrue: true,
          buttonText: 'True',
          buttonColor: Colors.green,
        ),

        /// widget: button
        new ButtonWidget(
          notifyParent: updateQuizState,
          isSelectedTrue: false,
          buttonText: 'False',
          buttonColor: Colors.red,
        ),

        /// widget: answer
        new AnswerWidget(quiz: quiz)
      ],
    );
  }
}
