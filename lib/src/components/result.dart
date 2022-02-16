import 'package:flutter/material.dart';

class ResultComponent extends StatelessWidget {
  const ResultComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Parabéns!',
        style: TextStyle(fontSize: 28.0),
      ),
    );
  }
}
