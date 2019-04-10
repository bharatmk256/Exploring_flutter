import 'package:flutter/material.dart';

class TapTap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TapTapState();
  }
}

class _TapTapState extends State<TapTap> {
  int _tapCounter = 0;
  void _tapPlus() {
    //this is setting state so we can see in
    setState(
      () {
        _tapCounter += 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Tap Tap"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new Center(
                child: new Text(
                  '$_tapCounter',
                  style: new TextStyle(
                    color: _tapCounter > 2000 ? Colors.red : Colors.greenAccent,
                    fontSize: 46.9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Center(
                child: new MaterialButton(
                    onPressed: _tapPlus,
                    color: Colors.greenAccent,
                    child: new Icon(Icons.add)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}