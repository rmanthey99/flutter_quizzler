import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizler/answer_button.dart';
import 'package:quizler/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(
          40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            //Since children is a list of widgets we can not have a list of lists whish is what map would do
            //instead we are using the spread operator to spread out the returns to new AnswerButton()'s
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    answer,
                    answerQuestion,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
