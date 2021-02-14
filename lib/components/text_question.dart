import 'package:flutter/material.dart';

class TextQuestion extends StatelessWidget {
  final String txt;
  TextQuestion(this.txt);
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(fontSize: 80, color: Colors.white),
    );
  }
}
