import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Screens",
      home: new Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
        builder: (BuildContext context) {
          return new NextScreen(name: _nameFieldController.text);
        },
      ),
    );
    if (results != null && results.containsKey("info")) {
      print(results["info"].toString());
      _nameFieldController.text = results["info"].toString();
    } else {
      print("Nothing!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First Screen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText: 'Enter your name',
              ),
            ),
          ),
          new ListTile(
            title: new RaisedButton(
              child: new Text(
                "Send to next Screen",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.greenAccent,
              onPressed: () {
                _goToNextScreen(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;

  NextScreen({Key key, this.name}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _backTextFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                "${widget.name}",
              ),
            ),
            new ListTile(
              title: new TextField(
                controller: _backTextFieldController,
                decoration: new InputDecoration(
                  labelText: 'Enter your name',
                ),
              ),
            ),
            new ListTile(
              title: new RaisedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    {
                      "info": _backTextFieldController.text,
                    },
                  );
                },
                child: new Text(
                  "Send Data Back",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.greenAccent,
              ),
            )
          ],
        ),
      ),
      // body: new ListTile(
      //   title: new Text(
      //     '${widget.name}',
      //   ),
      // ),
    );
  }
}
