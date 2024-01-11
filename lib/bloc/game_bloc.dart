import 'package:bloc/bloc.dart';
import 'package:quiz_game/bloc/game_event.dart';
import 'package:quiz_game/bloc/game_state.dart';
import 'package:quiz_game/manager/game_manager.dart';
import 'package:quiz_game/model/question.dart';

class GameBloc extends Bloc<GameEvent, GameState> {

  final _manager = GameManager();

  GameBloc(): super(InitialState()) {
    on<GameEvent>((event, emit) async {
      if(event is OnNextQuestion) {
        emit(Loading());
        await Future.delayed(const Duration(milliseconds: 300));
        if(_manager.currentQuestionIndex < questionList.length -1) {
          _manager.nextQuestion();
          emit(Success(questionList[_manager.currentQuestionIndex], 0));
        } else {
          emit(GameFinished());
        }
      } else if (event is OnRestartGame) {
        emit(Loading());
        await Future.delayed(const Duration(milliseconds: 300));
        _manager.currentQuestionIndex = -1;
        _manager.nextQuestion();
        emit(Success(questionList[_manager.currentQuestionIndex], 0));
      }
    });
  }
}