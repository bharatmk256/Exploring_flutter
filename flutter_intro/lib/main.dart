import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "welcome to flutter",
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter is cool"),
            leading: new Icon(Icons.arrow_back_ios),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.games),
                tooltip: "Games",
                onPressed: () => {},
              ),
              new IconButton(
                icon: new Icon(Icons.camera),
                tooltip: "Camera",
                onPressed: () => {},
              )
            ],
          ),
          bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.camera),
                title: new Text("camera"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.face),
                title: new Text("face"),
              ),
              new BottomNavigationBarItem(
                icon: new Icon(Icons.games),
                title: new Text("games"),
              ),
            ],
          ),
          body: new Container(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Text("Hello world"),
                new TextField(
                  decoration: new InputDecoration(
                      border: InputBorder.none, hintText: "Please enter text"),
                ),
                new Checkbox(
                  value: true,
                  onChanged: (bool value) {},
                ),
                new Radio<int>(
                  value: 0,
                  groupValue: 0,
                  onChanged: (_) {},
                ),
                new Switch(
                  value: false,
                  onChanged: (bool value) {},
                ),
                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: const Text('Raised'),
                      onPressed: () {},
                    ),
                    const RaisedButton(
                      child: const Text("Disebled"),
                      onPressed: null,
                    ),
                  ],
                ),
                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('Flat'),
                      onPressed: () {},
                    ),
                    const FlatButton(
                      child: const Text("Disebled"),
                      onPressed: null,
                    ),
                  ],
                ),
                new ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new OutlineButton(
                      child: const Text('Outline'),
                      onPressed: () {},
                    ),
                    const OutlineButton(
                      child: const Text("Disebled"),
                      onPressed: null,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
