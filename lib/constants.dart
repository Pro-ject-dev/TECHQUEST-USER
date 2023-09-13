import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

// HEIGHT WIDTH DECLARATIONS
height(con) => MediaQuery.of(con).size.height;
width(con) => MediaQuery.of(con).size.height;

//COLORS DECLARATIONS
Color bg_color = Colors.white;

// IMAGE DECLARATIONS
var homeImg = "Assets/home.jpg";
var mcqImg = "Assets/MCQ.png";
var picImg = "Assets/PIC.png";
var rapidImg = "Assets/RAPID.JPG";
var insImg = "Assets/INS.png";
var bgImg = "Assets/bgImg.json";
var quesImg = "Assets/QUESTION.jpg";
var bgimg_Mcq = "Assets/BG.jpg";
var team_name;

//CONTENTS DECLARATIONS
var header1 = "QUIZ EVENT";
var header = "MZCET TECHNICAL SYMPOSIYUM";

List<String> text = [];

Future gridOutput(input) async {
  text = [];
  final word = input;
  final numRows = 4;
  final numCols = 5;
  final totalCells = numRows * numCols - 1;
  final numRandomLetters = totalCells - word.length;
  final random = Random();
  final letters = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  final randomLetters = List.generate(
      numRandomLetters.toInt(), (index) => letters[random.nextInt(26)]);
  final allLetters = (word.split('')..addAll(randomLetters))..shuffle();
  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      if (i == numRows - 1 && j == numCols - 1) {
        text.add('⌫');
      } else {
        text.add(allLetters[i * numCols + j]);
      }
    }
  }
}

//List status = [];
List round1 = [];
List round2 = [];
List round3 = [];
List status = [];
List statusr3 = [];
List teamsr3 = [];
List Qno = [];
//
var r1_question_id;
var r1_score;
var r1_answer = "NO";
var r1_time;
var r2_question_id;
var r2_score;
var r2_answer = "NO";
var r2_time;
var r3_question_id;
var r3_score;
var performance_id;
String user_ans = "";
