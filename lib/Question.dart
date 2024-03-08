class Question {
  String q = '';
  bool a = false;

  Question({required this.q, required this.a});
  // the above statement is actually a short form of making a constructor :
  // Question({required string q, required bool a}) {
  //   que = q;
  //   ans = a;
  // }
}
