import 'package:equatable/equatable.dart';
import 'package:quiz_game/model/question.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

class InitialState extends GameState {}

class Loading extends GameState {}

class Success extends GameState {
  final Question currentQuestion;
  final int score;
  const Success(this.currentQuestion, this.score);

  @override
  List<Object?> get props => [currentQuestion, score];
}
class GameFinished extends GameState {}
