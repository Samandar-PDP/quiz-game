import 'package:quiz_game/model/question.dart';

class GameManager {
  int currentQuestionIndex = -1;

  void nextQuestion() {
    if(currentQuestionIndex < questionList.length-1) {
      currentQuestionIndex++;
    }
  }
}