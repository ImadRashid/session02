import 'package:flutter/material.dart';

import 'question.dart';

void main() {
  return runApp(QuizApp());
}

//----------------Re Draw---------------//

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(child: QuizPage()),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  // List<>

  List<Question> questionBank = [
    Question(
        userInputQuestion: 'Some cats are actually allergic to humans',
        userInputAnswer: true),
    Question(
        userInputQuestion: 'Capital of United States is New York',
        userInputAnswer: false),
    Question(
        userInputQuestion: 'Capital of Portugal is Lisbon',
        userInputAnswer: true),
    Question(
        userInputQuestion:
            'No piece of square dry paper can be folded in half more than 7 times.',
        userInputAnswer: false),
    Question(
        userInputQuestion: 'A slug\'s blood is green.', userInputAnswer: true),
    Question(
        userInputQuestion: 'You can lead a cow down stairs but not up stairs.',
        userInputAnswer: false),
  ];

  int questionNumber = 0;

  //= questionNumber + 1;

  @override
  Widget build(BuildContext context) {
    // questionNumber = questionNumber  1;
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
//--------------------This isi my first Button (True)-------------/////
//
//
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              // height: 30,
              minWidth: double.infinity,

              onPressed: () {
                bool userChoice = true;

                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (userChoice == correctAnswer) {
                  print("You got it Right");
                  setState(() {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  });
                } else {
                  print("You got it Wrong");
                  setState(() {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  });
                }

                if (questionNumber < questionBank.length - 1) {
                  questionNumber = questionNumber + 1;

                  print("True Press");
                }
              },
              child: Text(
                "True",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.green,
            ),
          ),
        ),
//----------------------------------------//
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              minWidth: double.infinity,
              color: Colors.red,
              onPressed: () {
                bool userChoice = false;

                bool correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (userChoice == correctAnswer) {
                  print("You got it Right");
                  setState(() {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
                  });
                } else {
                  print("You got it Wrong");
                  setState(() {
                    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
                  });
                }

                if (questionNumber < questionBank.length - 1) {
                  questionNumber = questionNumber + 1;

                  print("False Pressed");
                }
              },
              child: Text(
                "False",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
//------------------------Row for our Score Keeper---------------////////

        Row(
          children: scoreKeeper, //[]
        ),
      ],
    );
  }
}

// Row()
