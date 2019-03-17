import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Game',
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("Word Game"),
        ),
        body: new Center(
          child: new RandomSentences(),
        ),
      ),
    );
  }
}

class RandomSentences extends StatefulWidget {
  @override
  createState() => new _RandomSentencesState();
}

class _RandomSentencesState extends State<RandomSentences> {
  @override
  Widget build(BuildContext context) {
    final noun = new WordNoun.random();
    final adjective = new WordAdjective.random();
    return new Text("The programmer wrote a ${adjective.asCapitalized}"
        " app in flutter and showed it "
        "off to his ${noun.asCapitalized}");
  }
}
