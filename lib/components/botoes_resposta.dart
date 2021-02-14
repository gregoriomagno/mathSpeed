import 'package:flutter/material.dart';

class BotoesResposta extends StatelessWidget {
  final Function(bool) _respostaCorreta;
  BotoesResposta(this._respostaCorreta);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {
                  print('------------TRUE--------------');
                  _respostaCorreta(true);
                },
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.red,
                onTap: () {
                  print('--------------FALSE------------');
                  _respostaCorreta(false);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Icon(
                      Icons.clear_sharp,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
