import 'package:adv_basic/models/answerButton.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) // función para elegir una respuesta
      onSelectAnswer; // función para elegir una respuesta (se ejecuta cuando se toca un botón de respuesta

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0; // índice de la pregunta actual

  void answerQuestion(String selectedAnswers) {
    // elige una respuesta y actualiza el estado de la pantalla
    widget.onSelectAnswer(
        selectedAnswers); // ejecuta la función para elegir una respuesta

    setState(() {
      // actualiza el estado de la pantalla
      currentQuestionIndex++; // incrementa el índice de la pregunta actual
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex]; // pregunta actual

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              // recorre las respuestas y las muestra en pantalla
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              ); // muestra el botón de respuesta en pantalla
            }),
          ],
        ),
      ),
    );
  }
}
