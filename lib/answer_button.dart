import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answerText, required this.onPressed,  });

  final String answerText;
  final Function() onPressed;


  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     style: ElevatedButton.styleFrom(
       foregroundColor: Colors.white,
           backgroundColor: Colors.deepPurple[900],
       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
     ),
       onPressed: onPressed, child: Text(answerText, textAlign: TextAlign.center, ));
  }
}