import 'dart:ui';
import 'package:eduyaari02/viewdemo/second_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.blueGrey[800],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mycolor.primary,
        title: Text("INSTRUCTION"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Text(
            //   'TRIVIA APP',
            //   textAlign: TextAlign.center,
            //   style: GoogleFonts.rubik(
            //     fontSize: 50,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.45,
            //   width: 300,
            //   child: Center(
            //     child: ElevatedButton(
            //       style: raisedButtonStyle,
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(builder: (context) => SecondPage()),
            //         );
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             'TAKE QUIZ',
            //           ),
            //           SizedBox(
            //             width: 10,
            //           ),
            //           Icon(
            //             Icons.arrow_forward_rounded,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

void _ontapped() {}
