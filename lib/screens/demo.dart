import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  String? title;

  Demo({ required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: PageView.builder(
        itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 100, width: 100,
            child: Center(child: Text("$index")),);
          },

      ),
    );
  }
}
