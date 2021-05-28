import 'package:quizzler/models/question.dart';

// Encapsulation in Action
class QuizBrain {
  int _questionNumber = 0;

  // Private list with _***
  final List<Question> _questionBank = [
    Question(q: 'Question 1', a: true),
    Question(q: 'Question 2', a: false),
    Question(q: 'Question 3', a: true),
    Question(q: 'Question 4', a: false),
    Question(q: 'Question 5', a: true),
    Question(q: 'Question 6', a: false),
    Question(q: 'Question 7', a: false),
    Question(q: 'Question 8', a: true),
    Question(q: 'Question 9', a: false),
    Question(q: 'Question 10', a: false),
    Question(q: 'Question 11', a: true),
    Question(q: 'Question 12', a: false),
    Question(q: 'Question 13', a: false),
    Question(q: 'Question 14', a: false),
    Question(q: 'Question 15', a: false),
    Question(q: 'Question 16', a: false),
    Question(q: 'Question 17', a: false),
    Question(q: 'Question 18', a: false),
    Question(q: 'Question 19', a: false),
    Question(q: 'Question 20', a: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
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
