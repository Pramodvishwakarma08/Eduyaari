import 'package:flutter/material.dart';

class AnswerPage extends StatefulWidget {
  var title;
   AnswerPage({Key? key, this.title}) : super(key: key);

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}



class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Comming Soon"),
      ),
    );
  }
}
