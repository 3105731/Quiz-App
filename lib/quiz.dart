
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_app/questions.dart';
import 'package:new_app/results.dart';

import 'data/question.dart';
import 'home.dart';


class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);


  @override
  State<Quiz> createState() => _Quiz();
}

class _Quiz extends State<Quiz> {
   List<String> SelectedAnswer = [];
  Widget? activeScreen;

  void chooseAnswer(String answer){
    log(answer);
    SelectedAnswer.add(answer);

    if(SelectedAnswer.length == questions.length){
    setState(() {
      activeScreen = Result(SelectedAnswer, Restart);


    });
    }
    log(SelectedAnswer.toString());

  }

  void Restart(){
    setState(() {
      SelectedAnswer =[];
      activeScreen = Home(switchScreen);
    });

  }

  @override
  void initState() {
    activeScreen = Home(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(chooseAnswer);

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
              ])
          ),
          child:  activeScreen,),
      ),
    );
  }

}