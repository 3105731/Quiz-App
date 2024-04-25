import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/question.dart';
import 'answer_button.dart';

class Questions extends StatefulWidget {
  const Questions( this.onSelectedAnswer,{Key? key}) : super(key: key);
  final void Function(String) onSelectedAnswer;



  @override
  State<Questions> createState() => _Questions();
}

class _Questions extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion= questions[currentQuestionIndex];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text(
             currentQuestion.text,
             style: GoogleFonts.lato(
               color: Colors.purple[100],
               fontSize: 24,
               fontWeight: FontWeight.bold,
             ),
             textAlign: TextAlign.center,
           ),
          const SizedBox(height: 40),

         ...currentQuestion.ShuffoledAnswers.map(
        (e)  {
         return   Container(
           margin: EdgeInsets.all(5),
             child: AnswerButton(answerText: e ,
                 onPressed:  (){
               answerQuestion(e);
                 }));
          },),


        ],
      ),
    );
  }
}