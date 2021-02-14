import 'package:flutter/material.dart';

class CounterPoints extends StatelessWidget {
  final int pontos;
  CounterPoints(this.pontos);
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '$pontos',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );

  }
}