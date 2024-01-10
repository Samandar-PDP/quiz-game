import 'package:equatable/equatable.dart';

class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class OnNextQuestion extends GameEvent {}