import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/components/componenst.dart';
import 'dart:developer' as developer;

import 'package:projeto_perguntas/src/components/quiz.dart';

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var _selectedQuestion = 0;
  final List<Map<String, Object>> _question = const [
    {
      'text': 'Wha is favorite color?',
      'answer': [
        {'text': 'black', 'nota': 10},
        {'text': 'yellow', 'nota': 5},
        {'text': 'red', 'nota': 3},
      ],
    },
    {
      'text': 'Wha is favorite animal?',
      'answer': [
        {'text': 'dog', 'nota': 10},
        {'text': 'cat', 'nota': 10},
        {'text': 'lion', 'nota': 10},
      ],
    },
    {
      'text': 'Wha is favorite teacher?',
      'answer': [
        {'text': 'Jane', 'nota': 10},
        {'text': 'David', 'nota': 10},
        {'text': 'Laura', 'nota': 10},
      ],
    }
  ];

  void _anwser() {
    if (hasQuestionSelected) {
      setState(() {
        return _selectedQuestion++;
      });
      developer.log(
        'Pergunta respondida $_selectedQuestion',
        name: 'method responder',
      );
    }
  }

  bool get hasQuestionSelected {
    return _selectedQuestion < _question.length;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
        centerTitle: true,
      ),
      body: hasQuestionSelected
          ? Quiz(
              questions: _question,
              selectedQuestion: _selectedQuestion,
              onAnwser: _anwser,
            )
          : ResultComponent(),
    );
  }
}
