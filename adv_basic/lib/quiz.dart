import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/questionsScreen.dart';
import 'package:adv_basic/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/models/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // respuestas seleccionadas
  var activeScreen = 'start-screen'; // pantalla activa

  void switchScreen() {
    setState(() {
      activeScreen =
          'questions-screen'; // cambia la pantalla activa a la de preguntas
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      // si no se han seleccionado todas las respuestas
      setState(() {
        // limpia las respuestas seleccionadas
        activeScreen =
            'result-screen'; // cambia la pantalla activa a la de resultados
      });
      return;
    }
  }

  void restartQuiz() {
    setState(() {
      // limpia las respuestas seleccionadas
      selectedAnswers = [];
      activeScreen =
          'question-screen'; // cambia la pantalla activa a la de preguntas
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      // si la pantalla activa es la de preguntas
      screenWidget = QuestionsScreen(
        // muestra la pantalla de preguntas
        onSelectAnswer: chooseAnswer, // función para elegir una respuesta
      );
    }

    if (activeScreen == 'result-screen') {
      // si la pantalla activa es la de resultados
      screenWidget =
          ResultsScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz);
      // muestra la pantalla de resultados
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.red],
              ),
            ),
            child: screenWidget, //muestro la pantalla de preguntas
          ),
        ));
  }
}
