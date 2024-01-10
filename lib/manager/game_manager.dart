import 'package:quiz_game/model/question.dart';

class GameManager {
  int currentQuestionIndex = 0;

  void _nextQuestion() {
    if(currentQuestionIndex < questionList.length-1) {
      currentQuestionIndex++;
    }
  }
}