import 'package:flutter/material.dart';
import 'package:quizler/questions_screen.dart';
import 'package:quizler/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget switchScreenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      switchScreenWidget = const QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(97, 12, 243, 1),
                Color.fromRGBO(124, 82, 196, 1),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: switchScreenWidget,
        ),
      ),
    );
  }
}
