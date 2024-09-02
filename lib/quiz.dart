import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});



  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

var activeScreen = 'start-screen';


void chooseAnswer(String answer){
    selectedAnswer.add(answer);

    if(selectedAnswer.length == questions.length){
      setState(() {
      
        activeScreen = 'results-screen';
      });
    }
}


void switchScreen(){
  setState(() {
    activeScreen = 'questions-screen';
  });
}

void restartQuiz(){
 setState(() {
   selectedAnswer =[];
   activeScreen = 'questions-screen';
 });
}


  @override
  Widget build(context) {
    Widget screenWidget =  StartScreen(switchScreen);

    if(activeScreen == 'questions-screen'){

     screenWidget =  QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultScreen(chooseAnswer: selectedAnswer,onRestart: restartQuiz,);
    }


    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget,
            ),
      ),
    );
  }
}
