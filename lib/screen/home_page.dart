import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_game/bloc/game_bloc.dart';
import 'package:quiz_game/bloc/game_event.dart';
import 'package:quiz_game/bloc/game_state.dart';
import 'package:quiz_game/model/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isClicked = true;
  int _score = 0;

  @override
  void initState() {
    BlocProvider.of<GameBloc>(context).add(OnNextQuestion());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text("English Quiz",style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.transparent),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.purple,
              Colors.pink
            ]
          )
        ),
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if(state is GameFinished) {
              showDialog(context: context, builder: (dialogContext) => AlertDialog(
                title: const Text("Game Finished"),
                content: Text("Your score is $_score"),
                actions: [
                  TextButton(onPressed: () {
                    _score = 0;
                    _isClicked = true;
                    Navigator.of(context).pop();
                    BlocProvider.of<GameBloc>(context).add(OnRestartGame());
                  }, child: Text("OK"))
                ],
              ));
            }
          },
          builder: (context, state) {
            if(state is Success) {
              return _buildBody(state.currentQuestion);
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
        )
      ),
    );
  }
  Widget _buildBody(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(question.image,
              width: MediaQuery.of(context).size.width - 100,fit: BoxFit.cover,),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _isClicked ? () => _checkAnswer(0, question.correctAnswer) : null, child: Text(question.options[0],style: TextStyle(color: Colors.black),)),
                  ElevatedButton(onPressed: _isClicked ? () => _checkAnswer(1, question.correctAnswer) : null, child: Text(question.options[1],style: TextStyle(color: Colors.black),)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _isClicked ? () => _checkAnswer(2, question.correctAnswer) : null, child: Text(question.options[2],style: TextStyle(color: Colors.black),)),
                  ElevatedButton(onPressed: _isClicked ? () => _checkAnswer(3, question.correctAnswer) : null, child: Text(question.options[3],style: TextStyle(color: Colors.black),)),
                ],
              ),
              ElevatedButton(onPressed: !_isClicked ? () {
                _isClicked = true;
                BlocProvider.of<GameBloc>(context).add(OnNextQuestion());
              } : null, child: Text("NEXT"))
            ],
          ),
        )
      ],
    );
  }
  void _checkAnswer(int index, int correctAnswer) {
    setState(() {
      _isClicked = false;
    });
    if(index == correctAnswer -1) {
      _score++;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content:
      Text("Correct"),backgroundColor: Colors.green,duration: Duration(seconds: 1)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content:
      Text("Incorrect"),backgroundColor: Colors.red,duration: Duration(seconds: 1)));
    }
  }
}
