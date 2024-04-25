import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/summary.dart';

import 'data/question.dart';

class Result extends StatelessWidget {
  Result(this.SelectedAnswer, this.restart, {Key? key}) : super(key: key);
  final List<String> SelectedAnswer;
  final void Function() restart;

  List<Map<String, Object>>  get SummaryData{
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < SelectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': SelectedAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {

    int numOfCorrect = SummaryData.where((element) =>
    element['user_answer'] == element['correct_answer']).length;


    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You answered $numOfCorrect out of ${questions.length} questions correctly",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Summary(SummaryData),

          const SizedBox(height: 60),
          OutlinedButton.icon(onPressed:restart,
    icon: Icon(Icons.restart_alt_outlined,color: Colors.purple[100] ,),
    label: Text("Restart Quiz !", style: TextStyle(
    color: Colors.purple[100],
      fontSize: 15,
   )

          ),
          ),
        ],
      ),
    );
  }
}