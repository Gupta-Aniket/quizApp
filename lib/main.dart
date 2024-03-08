import 'package:flutter/material.dart';
import 'package:quizzler/QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'Question.dart';

void main() {
  runApp(const home());
}

QuizBrain quizBrain = QuizBrain();
// final m = n - 1;
int count = 0;
int i = 0;
double _percentage = 0;

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quizzler(),
    );
  }
}

class Quizzler extends StatefulWidget {
  const Quizzler({super.key});

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> scoreKeeper = [];
  _showAlert(context) {
    _percentage = (count / i) * 100;
    String per = _percentage.toStringAsFixed(2);
    Alert(
      context: context,
      title: "Quiz Completed!",
      desc: "The Quiz is completed, Score : $count / $i \n Percentage : $per %",
      // buttons: [
      //   DialogButton(
      //       onPressed: () {
      //         quizBrain.reset();
      //         i = 0;
      //         count = 0;
      //       },
      //       child: Text("OK")),
      // ],
    ).show();
    quizBrain.reset();
    scoreKeeper.clear();
    i = 0;
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    // }
    void checkAnswer(bool s) {
      setState(() {
        if (quizBrain.questionsLast()) {
          if (quizBrain.getAnswer() == s) {
            count++;
            scoreKeeper.add(
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            );
          } else {
            scoreKeeper.add(
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            );
          }
          i = quizBrain.nextQuestion();
          //   this is in the end because keeping it in front was messing up with the the correct and wrong answer logics
        } else {
          _showAlert(context);
        }
      });
    }

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Score : $count / $i",
                style: const TextStyle(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),

              Expanded(
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    style: const TextStyle(fontSize: 46, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 200.0,
              //   width: double.infinity,
              // ),

              SizedBox(
                width: 300.0,
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: const Text(
                    'True',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ),
                  child: const Text(
                    'False',
                    style: TextStyle(fontSize: 35, color: Colors.redAccent),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15.0,
              // ),
              RawScrollbar(
                thumbColor: Colors.white70,
                trackVisibility: true,
                thumbVisibility: true,
                interactive: true,
                pressDuration: Duration.zero,
                thickness: 5,
                radius: const Radius.circular(20),
                child: SizedBox(
                  height: 40.0,
                  width: 375,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: scoreKeeper,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
