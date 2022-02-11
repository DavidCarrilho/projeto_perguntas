import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/components/answer.dart';
import 'dart:developer' as developer;

import 'package:projeto_perguntas/src/components/question.dart';

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      return _perguntaSelecionada++;
    });
    developer.log(
      'Pergunta respondida $_perguntaSelecionada',
      name: 'method responder',
    );
  }

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

    List<String> anwsers = perguntas[_perguntaSelecionada].cast()['answer'];
    // List<Widget> widgets = anwsers.map((t) => Answer(text: t, onSelected: _responder)).toList();
    // for (var anwsersText in anwsers) {
    //   widgets.add(Answer(
    //     text: anwsersText,
    //     onSelected: _responder,
    //   ));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Question(perguntas[_perguntaSelecionada]['text'].toString()),
            ...anwsers.map((t) => Answer(text: t, onSelected: _responder)).toList(),
          ],
        ),
      ),
    );
  }
}
