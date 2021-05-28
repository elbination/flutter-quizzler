class Question {
  late String questionText;
  late bool answer;

  Question({required String q, required bool a}) {
    questionText = q;
    answer = a;
  }
}

Question newQuestion = Question(q: 'text', a: true);
