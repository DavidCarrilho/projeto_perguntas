import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/components/answer.dart';
import 'dart:developer' as developer;

import 'package:projeto_perguntas/src/components/question.dart';

class _QuestionPageState extends State<QuestionPage> {
  Widget build(BuildContext context) {
    var perguntas = [
      {
        'text': 'Wha is favorite color?',
        'answer': ['black', 'yellow', 'red'],
      },
      {
        'text': 'Wha is favorite animal?',
        'answer': ['dog', 'cat', 'lion'],
      },
      {
        'text': 'Wha is favorite teacher?',
        'answer': ['Jane', 'David', 'Laura'],
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

    List<Widget> anwsers = [];
    for (var textoResp in perguntas[_perguntaSelecionada].cast()['answer']) {
      anwsers.add(Answer(text: textoResp, onSelected: _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Question(perguntas[_perguntaSelecionada]['text'].toString()),
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

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}
