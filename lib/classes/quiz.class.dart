import 'package:quizzler/models/question.model.dart';
import 'package:quizzler/models/score.model.dart';

class Quiz {
  int _currentIndex = 0;
  List<Score> _scoreKeeper = [];
  List<Question> _questions = [
    Question('Cyclones spin in a clockwise direction in the southern hemisphere.', true),
    Question('Goldfish only have a memory of three seconds.', false),
    Question('The capital of Libya is Benghazi.', false),
    Question('Japan and Russia did not sign a peace treaty after World War Two so are technically still at war.', true),
    Question('The first tea bags were made of silk.', true),
    Question('The Great Wall of China is visible from space.', false),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('The currency of France is the Franc.', false),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called \"Backrub\".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('The Channel Tunnel is the longest rail tunnel in the world.', true)
  ];

  /// get current question text
  String getQuestionText() {
    return _questions[_currentIndex].questionText;
  }

  /// get current question text
  bool getQuestionAnswer() {
    return _questions[_currentIndex].questionAnswer;
  }

  /// get all scores
  List getAllScores() {
    return _scoreKeeper.map((i) => i.icon).toList();
  }

  /// get quiz result
  int getQuizResult() {
    return _scoreKeeper.where((i) => i.result).length;
  }

  /// validate end of quiz
  bool isQuizFinished() {
    return _currentIndex >= _questions.length - 1;
  }

  /// increment question counter to show next question
  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
    }
  }

  /// update quiz score
  void updateQuizScore(Score item) {
    _scoreKeeper.add(item);
  }

  /// reset quiz
  void resetQuiz() {
    _currentIndex = 0;
    _scoreKeeper = [];
  }
}
