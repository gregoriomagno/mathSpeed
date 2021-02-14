import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mathSpeed/components/text_question.dart';

class NewQuestion extends StatefulWidget {
  final Function (bool,Function) setCorectQuestion;
 
  NewQuestion(this.setCorectQuestion,);
  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {
  
  
  int _num1,_num2,_result;
  bool corectQuestion;
bool operacaoOk(){
  int ok= randomNumber(2);
  print('verdade ou false = $ok');
  if( ok ==1 ) return true;
  else return false;
}
  int randomNumber(int max) {
    
    var rng = new Random();
    int numero = rng.nextInt(max);
    return numero;
  }
  void setQuestion(){
    //print(' new question');
    _num1 = randomNumber(10);
    _num2 = randomNumber(10);
    corectQuestion = operacaoOk();
    
    if(corectQuestion){
      _result = _num1 + _num2;
    }
    else{

       _result = randomNumber(10);
       
       if(_result == _num1 + _num2){
         corectQuestion = true;
       }
    }
    widget.setCorectQuestion(corectQuestion,setQuestion);
    print("$_num1 + $_num2 = $_result ($corectQuestion)");
    
   
  }
   @override
  void initState() {
    super.initState();
    setQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextQuestion('$_num1 + $_num2 ='),
        TextQuestion('$_result'),
      ],
    );
  }
}
