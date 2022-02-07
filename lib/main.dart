import 'package:flutter/material.dart';
import 'dart:developer' as developer;

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  final List<String> perguntas = [
    'Wha is favorite color?',
    'Wha is favorite animal?',
  ];

  final perguntaSelecionada = 0;

  void responder() {
    // perguntaSelecionada++;
    developer.log(
      'Pergunta respondida $perguntaSelecionada',
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
            Text(perguntas[perguntaSelecionada]),
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            RaisedButton(child: Text('Resposta 2'), onPressed: responder),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: responder,
            ),
          ],
        ),
      ),
    );
  }
}