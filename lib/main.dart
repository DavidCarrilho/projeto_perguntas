import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatelessWidget {
  final List<String> perguntas = [
    'Wha is favorite color?',
    'Wha is favorite animal?',
  ];

  PerguntaApp({Key key}) : super(key: key);

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
            RaisedButton(
              child: Text('Resposta 1'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Resposta 2'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Resposta 3'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
