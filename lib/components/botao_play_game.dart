import 'package:flutter/material.dart';
import 'package:mathSpeed/game_speed_screen.dart';




class BotaoPlayGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              child: Container(
                height: 100,
                width: 100,
                child: Card(
                  elevation: 5,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.blueGrey[800],
                    size: 50,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameSpeedScreen()));
              },
            );
  }
}