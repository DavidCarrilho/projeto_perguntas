import 'package:flutter/material.dart';
import 'package:projeto_perguntas/src/components/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function() onAnwser;

  Quiz({
    Key key,
    @required this.questions,
    @required this.selectedQuestion,
    @required this.onAnwser,
  }) : super(key: key);

  bool get hasQuestionSelected {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> anwsers =
        hasQuestionSelected ? questions[selectedQuestion].cast()['answer'] : [];

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['text'].toString()),
        ...anwsers.map((t) => Answer(text: t, onSelected: onAnwser)).toList(),
      ],
    );
  }
}
