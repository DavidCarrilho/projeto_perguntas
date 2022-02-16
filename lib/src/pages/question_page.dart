import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/components/answer.dart';
import 'package:projeto_perguntas/src/components/componenst.dart';
import 'dart:developer' as developer;

import 'package:projeto_perguntas/src/components/question.dart';

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _question = const [
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

  void _responder() {
    if (hasQuestionSelected) {
      setState(() {
        return _perguntaSelecionada++;
      });
      developer.log(
        'Pergunta respondida $_perguntaSelecionada',
        name: 'method responder',
      );
    }
  }

  bool get hasQuestionSelected {
    return _perguntaSelecionada < _question.length;
  }

  Widget build(BuildContext context) {
    List<String> anwsers = hasQuestionSelected
        ? _question[_perguntaSelecionada].cast()['answer']
        : [];
    // List<Widget> widgets = anwsers.map((t) => Answer(text: t, onSelected: _responder)).toList();
    // for (var anwsersText in anwsers) {
    //   widgets.add(Answer(
    //     text: anwsersText,
    //     onSelected: _responder,
    //   ));
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
        centerTitle: true,
      ),
      body: hasQuestionSelected
          ? Column(
              children: <Widget>[
                Question(_question[_perguntaSelecionada]['text'].toString()),
                ...anwsers
                    .map((t) => Answer(text: t, onSelected: _responder))
                    .toList(),
              ],
            )
          : ResultComponent()
    );
  }
}
