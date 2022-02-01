import 'package:flutter/material.dart';
import 'dart:developer' as developer;

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final List<String> perguntas = [
    'Wha is favorite color?',
    'Wha is favorite animal?',
  ];

  PerguntaApp({Key key}) : super(key: key);

  void responder() {
    developer.log(
      'Pergunta respondida',
      name: 'method responder',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            ElevatedButton(
              child: Text('Resposta 1'),
              onPressed: responder,
            ),
            ElevatedButton(
              child: Text('Resposta 2'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text('Resposta 3'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
