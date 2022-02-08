import 'package:flutter/material.dart';
import 'package:projeto_perguntas/components/answer.dart';
import 'dart:developer' as developer;

import 'package:projeto_perguntas/components/question.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  final List<String> perguntas = [
    'Wha is favorite color?',
    'Wha is favorite animal?',
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
            Question(perguntas[_perguntaSelecionada]),
            Answer(text: 'Resposta 1', onSelected: _responder,),
            Answer(text: 'Resposta 2', onSelected: _responder,),
            Answer(text: 'Resposta 3', onSelected: _responder,),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
