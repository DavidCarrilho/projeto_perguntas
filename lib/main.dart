import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'src/components/answer.dart';
import 'src/components/question.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  final List<Map<String, dynamic>> perguntas = [
    {
      'text': 'Wha is favorite color?',
      'answer': ['black', 'yellow', 'red'],
    },
    {
      'text': 'Wha is favorite animal?',
      'anwser': ['dog', 'cat', 'lion'],
    },
    {
      'text': 'Wha is favorite teacher?',
      'anwser': ['Jane', 'David', 'Laura'],
    }
  ];

  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() => _perguntaSelecionada++);
    developer.log(
      'Pergunta respondida $_perguntaSelecionada',
      name: 'method responder',
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Question(perguntas[_perguntaSelecionada]['texto'].toString()),
            Answer(
              text: 'Resposta 1',
              onSelected: _responder,
            ),
            Answer(
              text: 'Resposta 2',
              onSelected: _responder,
            ),
            Answer(
              text: 'Resposta 3',
              onSelected: _responder,
            ),
          ],
        ),
      ),
    );
  }
}
