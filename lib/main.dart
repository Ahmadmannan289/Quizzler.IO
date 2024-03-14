import 'package:flutter/material.dart';
import 'questionbank.dart';
import 'questions.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';


Quizbrain Brain=Quizbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:Center(child: Text('Quizzler.io')) ,backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scorekeeper=[ ];





  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Brain.getQuestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                bool correctans=Brain.getCorrectanswer();


                setState(() {
                    Brain.limit_question();

                    if (correctans == true) {
                      scorekeeper.add(
                        Icon(Icons.check, color: Colors.green,),

                      );
                      if (Brain.qno < Brain.questionbank.length-1){

                      }
                      else {
                        Alert(context: context, title: "Quiz Completed!!", desc: "Check the result from bottom row").show();
                        Brain.qno = 0;
                        // scorekeeper.clear();
                      }
                    }

                    else {
                      scorekeeper.add(
                        Icon(Icons.close, color: Colors.red,),
                      );
                      if (Brain.qno < Brain.questionbank.length-1){

                      }
                      else {
                        Alert(context: context, title: "Quiz Completed!!", desc: "Check the result from bottom row").show();
                        Brain.qno = 0;
                        // scorekeeper.clear();
                      }
                    }

                    // if (Brain.qno < Brain.questionbank.length-1)
                    //   Brain.qno++;
                    // else {
                    //   Alert(context: context, title: "Quizzler", desc: "You have finished the quiz!").show();
                    //   Brain.qno = 0;
                    //   scorekeeper.clear();
                    // }

                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                bool correctans=Brain.getCorrectanswer();

                // if (correctans==true)
                //   {
                //
                //
                //   }
                // else{
                //
                // }
                setState(() {
                  Brain.limit_question();
                  if (correctans==true)
                    {

                      scorekeeper.add(
                        Icon(Icons.close,color: Colors.red,),
                      );
                    if (Brain.qno < Brain.questionbank.length-1){

                    }
                    else {
                    Alert(context: context, title: "Quiz Completed!!", desc: "Check the result from bottom row").show();
                    Brain.qno = 0;
                    // scorekeeper.clear();
                    }
                    }


                  else{
                    scorekeeper.add(
                      Icon(Icons.check,color: Colors.green,),
                    );

                    if (Brain.qno < Brain.questionbank.length-1){

                    }
                    else {
                  Alert(context: context, title: "Quiz Completed!! ", desc: "Check the result from bottom row").show();
                      Brain.qno = 0;
                      // scorekeeper.clear();
                    }

                  }


                });
              },
            ),
          ),
        ),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

            children: scorekeeper
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

