import 'package:flutter/material.dart';

class ResultComponent extends StatelessWidget {
  final int score;

  const ResultComponent({Key key, this.score}) : super(key: key);

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
    return Center(
      child: Text(
        displayResult,
        style: TextStyle(fontSize: 28.0),
      ),
    );
  }
}
