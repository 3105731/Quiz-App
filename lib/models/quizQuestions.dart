class QuizQuestions{

  final String text;
  final List<String> answers;

  QuizQuestions(this.text, this.answers);

  List<String> get ShuffoledAnswers{
   final shuffoledList = List.of(answers);
   shuffoledList.shuffle();
    return shuffoledList;

  }

}