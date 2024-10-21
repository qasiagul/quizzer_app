class Question {
  late String questionText;
  late bool questionAnswer;

  Question({required String q, required bool a}){
    questionText = q;
    questionAnswer = a;
  }
}

// //
// class Question{
//   late String questionText;
//   late bool questionAnswer;
//
//   Question(String s, bool bool);
//
// }
//
// Question newQuestion = Question('text', true);