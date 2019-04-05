import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(title),
      ),
      body: new Center(
        child: new CustomButton(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(
          content: new Text("Hello Gestures"),
          backgroundColor: Theme.of(context).backgroundColor,
          duration: new Duration(hours: 0, minutes: 0,seconds: 0,milliseconds: 500, microseconds: 0),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      // the actual button
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: new Text("First Button!"),
      ),
    );
  }
}
