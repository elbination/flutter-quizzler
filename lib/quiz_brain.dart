import 'package:quizzler/models/question.dart';

// Encapsulation in Action
class QuizBrain {
  int _questionNumber = 0;

  // Private list with _***
  final List<Question> _questionBank = [
    Question('Question 1', true),
    Question('Question 2', false),
    Question('Question 3', true),
    Question('Question 4', false),
    Question('Question 5', true),
    Question('Question 6', false),
    Question('Question 7', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String? getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool? getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  // Check to see if reached the last question
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  // Sets the _questionNumber to 0
  void reset() {
    _questionNumber = 0;
  }
}
