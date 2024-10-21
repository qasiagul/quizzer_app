import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brian.dart';
void main() => runApp(Quizzler());

class  Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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

  List<Widget> scoreKeeper =[];

  void checkAnswer(userPickedAnswer){
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if(quizBrain.isFinished() == true){
        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];

      }
      else{
        if(userPickedAnswer == correctAnswer){
          scoreKeeper.add(Icon(Icons.check,color: Colors.green,));
        }else{
          scoreKeeper.add(Icon(Icons.close,color: Colors.red,));
        }
        quizBrain.nextQuestion();
      }

    });
  }

  QuizBrain quizBrain = QuizBrain();

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
              child: Text(quizBrain.getQuestionText(),
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
         child: TextButton(
           child: Container(
             color: Colors.green,
             child: Center(
               child: Text(
                   'True',
                 style: TextStyle(
                   fontSize: 20.0,
                   color: Colors.white,
                 ),
               ),
             ),
           ),
           onPressed: (){
           checkAnswer(true);
           },
         ),
       ),
        SizedBox(height: 15,),
        Expanded(
          child: TextButton(
            onPressed: (){
              checkAnswer(false);
            },
            child: Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        )
      ],
    );
  }
}







//  List<String> questions = [
// 'Approximately one quarter of human bones are in the feet.',
// 'A slug\'s blood is green.' ,
//    'Sharks are mammals.',
//    'Sea otters have a favorite rock they use to break open food.',
//    'The blue whale is the biggest animal to have ever lived.',
//    'The hummingbird egg is the world\'s smallest bird egg.'
//  ];

//  List<bool> answers = [ true, true, false, true, true, true,];

//  Question q1 = Question(q:  'You can lead a cow down stairs but not up stairs.',  a: false,);
