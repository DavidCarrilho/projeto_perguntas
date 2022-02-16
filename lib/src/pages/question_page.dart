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
  var _totalScore = 0;
  final List<Map<String, Object>> _question = const [
    {
      'text': 'Wha is favorite color?',
      'answer': [
        {'text': 'black', 'score': 6},
        {'text': 'yellow', 'score': 5},
        {'text': 'red', 'score': 3},
      ],
    },
    {
      'text': 'Wha is favorite animal?',
      'answer': [
        {'text': 'dog', 'score': 7},
        {'text': 'cat', 'score': 4},
        {'text': 'lion', 'score': 5},
      ],
    },
    {
      'text': 'Wha is favorite teacher?',
      'answer': [
        {'text': 'Jane', 'score': 8},
        {'text': 'David', 'score': 9},
        {'text': 'Laura', 'score': 3},
      ],
    }
  ];

  void _anwser(int score) {
    if (hasQuestionSelected) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
      developer.log(
        'Pergunta respondida $_selectedQuestion',
        name: 'method responder',
      );
      developer.log(
        'Pontuação Total: $_totalScore',
        name: 'Pontuação Total',
      );
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestionSelected {
    return _selectedQuestion < _question.length;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perguntas', style: TextStyle(fontSize: 26),),
        centerTitle: true,
      ),
      body: hasQuestionSelected
          ? Quiz(
              questions: _question,
              selectedQuestion: _selectedQuestion,
              onAnwser: _anwser,
            )
          : ResultComponent(
              score: _totalScore,
              whileRestartQuiz: _restartQuiz,
            ),
    );
  }
}
