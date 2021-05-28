import 'package:quizzler/models/question.dart';

// Encapsulation in Action
class QuizBrain {
  int _questionNumber = 0;

  // Private list with _***
  final List<Question> _questionBank = [
    Question(questionText: 'Question 1', answer: true),
    Question(questionText: 'Question 2', answer: false),
    Question(questionText: 'Question 3', answer: true),
    Question(questionText: 'Question 4', answer: false),
    Question(questionText: 'Question 5', answer: true),
    Question(questionText: 'Question 6', answer: false),
    Question(questionText: 'Question 7', answer: false),
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
