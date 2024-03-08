import 'Question.dart';

class QuizBrain {
  int _queNumber = 0;
  List<Question> _questions = [
    Question(q: "The Earth is flat.", a: false),
    Question(q: "Cats can fly.", a: false),
    Question(q: "Water boils at 100 degrees Celsius at sea level.", a: true),
    Question(q: "Dolphins are mammals.", a: true),
    Question(q: "Mount Everest is the tallest mountain on Earth.", a: true),
    Question(q: "The capital of France is Berlin.", a: false),
    Question(q: "The moon is made of cheese.", a: false),
    Question(q: "The Great Wall of China is visible from space.", a: false),
    Question(q: "Bananas are berries.", a: true),
    Question(q: "Humans use only 10% of their brains.", a: false),
    Question(q: "Venus is the closest planet to the Sun.", a: false),
    Question(q: "A group of crows is called a murder.", a: true),
    Question(q: "Elephants can jump.", a: false),
    Question(
        q: "The Eiffel Tower is taller in the summer due to expansion.",
        a: true),
    Question(q: "Spiders are insects.", a: false),
    Question(
        q: "The Amazon River is the longest river in the world.", a: false),
    Question(q: "The Declaration of Independence was signed in 1776.", a: true),
    Question(q: "Penguins can fly.", a: false),
    Question(q: "Goldfish have a three-second memory.", a: false),
    Question(
        q: "Sea otters have a favorite rock they use to break open food.",
        a: true),
    Question(q: "Questions Complete, press any button to continue!", a: true),
  ];
  // int n = _questions.length;

  int nextQuestion() {
    if (_queNumber < _questions.length) {
      _queNumber++;
    }
    return _queNumber;
  }

  bool questionsLast() {
    if (_queNumber < _questions.length - 1) {
      return true;
    }
    return false;
  }

  String getQuestionText() {
    return _questions[_queNumber].q;
  }

  bool getAnswer() {
    return _questions[_queNumber].a;
  }

  void reset() {
    _queNumber = 0;
  }
}
