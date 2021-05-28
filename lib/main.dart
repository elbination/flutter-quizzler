import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      // If quiz is finished
      if (quizBrain.isFinished() == true) {
        // Show the alert
        Alert(
                context: context,
                title: 'Finished!',
                desc: 'You\'ve reached the end of the quiz')
            .show();
        // Reset the questionNumber
        quizBrain.reset();
        // Empty out the scoreKeeper
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          print('User got it right');
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          print('User got it wrong');
        }
        quizBrain.nextQuestion();
      }
    });
  }

  // List<String> questions = [
  //   'First Question',
  //   'Second Question',
  //   'Third Question',
  //   'Fourth Question',
  // ];
  // List<bool> answers = [
  //   true,
  //   false,
  //   false,
  //   true,
  // ];
  //
  // Question q1 = Question(q: 'Question 1', a: true);

  // List<Question> questionBank = [
  //   Question(q: 'Question 1', a: true),
  //   Question(q: 'Question 2', a: true),
  //   Question(q: 'Question 3', a: false),
  //   Question(q: 'Question 4', a: false),
  //   Question(q: 'Question 5', a: true),
  // ];

  // int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // questionBank[questionNumber].questionText,
                // quizBrain.questionBank[questionNumber].questionText,
                // quizBrain.getQuestionText(questionNumber),
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              // User picked true => list add check
              onPressed: () {
                // bool correctAnswer = questionBank[questionNumber].answer;
                // bool correctAnswer =
                //     quizBrain.questionBank[questionNumber].answer;
                // bool correctAnswer = quizBrain.getCorrectAnswer(questionNumber);
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                // bool correctAnswer = questionBank[questionNumber].answer;
                // bool correctAnswer =
                //     quizBrain.questionBank[questionNumber].answer;
                // bool correctAnswer = quizBrain.getCorrectAnswer(questionNumber);
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
