import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/models/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    // función para obtener los datos de resumen
    final List<Map<String, Object>> summary = []; // lista de datos de resumen

    for (var i = 0; i < chosenAnswers.length; i++) {
      // recorre las respuestas seleccionadas
      summary.add({
        // agrega los datos de resumen a la lista
        'question_index': i, // índice de la pregunta
        'question': questions[i].text, // texto de la pregunta
        'correct_answer':
            questions[i].answers[0], // respuesta correcta de la pregunta
        'chosen_answer': chosenAnswers[i], // respuesta elegida por el usuario
      });
    }

    return summary; // devuelve la lista de datos de resumen
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData(); // datos de resumen
    final numTotalQuestions = questions.length; // número total de preguntas
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] ==
          data[
              'chosen_answer']; // compara las respuestas correctas con las elegidas
    }).length; // número de respuestas correctas

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "tus respuesta correctas son $numCorrectQuestions de $numTotalQuestions",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
