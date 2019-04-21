import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    new MaterialApp(
      title: "Shared Prefrence",
      home: new Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _enterdDataField = new TextEditingController();
  String _savedData = "";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(
      () {
        if (preferences.getString("data") != null &&
            preferences.getString("data").isNotEmpty) {
          _savedData = preferences.getString("data");
        } else {
          _savedData = "Empty Shared Prefrence";
        }
      },
    );
  }

  _saveMessage(String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(
        "data", message); // key : value ==> "bharat" : "Smart"
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Shared Prefrence"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Container(
        padding: const EdgeInsets.all(13.4),
        alignment: Alignment.topCenter,
        child: new ListTile(
          title: new TextField(
            controller: _enterdDataField,
            decoration: new InputDecoration(labelText: "write something"),
          ),
          subtitle: new FlatButton(
            color: Colors.redAccent,
            onPressed: () {
              // save
              _saveMessage(_enterdDataField.text);
            },
            child: new Column(
              children: <Widget>[
                new Text("Save Data"),
                new Padding(
                  padding: new EdgeInsets.all(14.5),
                ),
                new Text(_savedData),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
