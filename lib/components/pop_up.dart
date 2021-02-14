import 'package:flutter/material.dart';
import 'package:mathSpeed/main.dart';

import '../game_speed_screen.dart';

class PopUp extends StatelessWidget {
  final int pontuacao;
  PopUp(this.pontuacao);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      // title: const Text('Game Over'),
      backgroundColor: Colors.blueGrey[900],
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Game Over',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                'Pontuação: $pontuacao',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: 50,
                        child: Icon(
                          Icons.replay_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ),
                    onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameSpeedScreen()));
              },
                  ),
                  
                  GestureDetector(
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: 50,
                        child: Icon(
                          Icons.home,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                    ),
                    onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
                  ),
                  
                ],
              ),
            ],
          ),
        ],
      ),
      // actions: <Widget>[
      //   new FlatButton(
      //     onPressed: () {
      //       Navigator.of(context).pop();
      //     },
      //     textColor: Theme.of(context).primaryColor,
      //     child: const Text('Close'),
      //   ),
      // ],
    );
  }
}
