class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text; // Question text , texto de la pregunta
  final List<String>
      answers; // List of possible answers, lista de posibles respuestas

  List<String> getShuffledAnswers() {
    // Shuffle the answers, barajar las respuestas
    final shuffledList = List.of(answers); // Copy the list, copiar la lista
    shuffledList.shuffle(); // Shuffle the list, barajar la lista
    return shuffledList; // Return the shuffled list, devolver la lista barajada
  }
}
