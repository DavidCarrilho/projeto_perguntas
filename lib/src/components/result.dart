import 'package:flutter/material.dart';

class ResultComponent extends StatelessWidget {
  final int score;
  final void Function() whileRestartQuiz;

  const ResultComponent({
    Key key,
    this.score,
    this.whileRestartQuiz,
  }) : super(key: key);

  String get displayResult {
    if (score < 8) {
      return 'Parabéns!';
    } else if (score < 12) {
      return 'Você é Bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            displayResult,
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        FlatButton(
          onPressed: whileRestartQuiz,
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 20.0),
          ),
          textColor: Colors.blue,
        )
      ],
    );
  }
}
