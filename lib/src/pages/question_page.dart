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
