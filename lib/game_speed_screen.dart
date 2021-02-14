import 'package:flutter/material.dart';
import 'package:mathSpeed/components/new_question.dart';
import 'package:mathSpeed/components/pop_up.dart';

import 'components/botoes_resposta.dart';
import 'components/counter_points.dart';

class GameSpeedScreen extends StatefulWidget {
  @override
  _GameSpeedScreenState createState() => _GameSpeedScreenState();
}

class _GameSpeedScreenState extends State<GameSpeedScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Function setQuestion;
  bool corectQuestion;
  bool resposta;
  int timeQuestion = 5000;
  int pontuacao = 0;
  void setCorectQuestion(bool _ok, Function newquestion) {
    corectQuestion = _ok;
    //print('Essa operação é: $corectQuestion');
    setQuestion = newquestion;
  }

  void setResposta(bool ok) {
    //print('setResposta');
    resposta = ok;
    pontuar();
  }

  void showPopUp(int pontuacao) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PopUp(pontuacao),
    );
  }

  void gameOver() {
    showPopUp(pontuacao);
    controller.reset();
    pontuacao = 0;
  }

  void pontuar() {
   // print('pontuar ($corectQuestion ==  $resposta)');
    if (corectQuestion == resposta) {
      setState(() {
        pontuacao++;
        //print('Pontuacao (Acertou)');
        timeQuestion -= 500;
        if (timeQuestion < 1000) timeQuestion = 1000;
        setDuration(timeQuestion);
        startAnimation();
        setQuestion();
      });
    } else {
      setState(() {
        print('Pontuacao (Errou)');
        gameOver();
      });
    }
  }

  void startAnimation() {
    if (controller.status == AnimationStatus.completed ||
        controller.status == AnimationStatus.forward) {
      controller.reset();
      controller.forward();
    } else {
      //print('Errou PopUp');
      //
      controller.forward();
    }
    print(controller.status);
  }

  void setDuration(int tempo) {
    controller.duration = Duration(milliseconds: tempo);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this);
    animation = Tween<double>(begin: 390, end: 0).animate(controller)
      ..addListener(() {
        setState(() {
          if (controller.status == AnimationStatus.completed) {
            //print('tempo esgotado PopUp');
            gameOver();
          
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: animation.value,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ],
            ),
            Expanded(
              flex: 10,
              child: CounterPoints(pontuacao),
            ),
            Expanded(
              flex: 60,
              child: NewQuestion(setCorectQuestion),
            ),
            Expanded(
              flex: 15,
              child: BotoesResposta(setResposta),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
