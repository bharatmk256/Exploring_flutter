import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// https://jsonplaceholder.typicode.com/posts

void main() async {
  List _data = await getJson();
  print(_data[0]["title"]);
  for (var i = 0; i < _data.length; i++) {
    print("Data: ${_data[i]["title"]}");
  }
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Json Parsing"),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int position) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 13.4,
                ),
                ListTile(
                  title: Text("${_data[position]["title"]}"),
                  subtitle: Text("${_data[position]["body"]}"),
                  leading: CircleAvatar(
                    // radius: 30.0,
                    backgroundColor: Colors.redAccent,
                    child: Text(
                      _data[position]["title"][0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  onTap: () => showTapMessage(context, _data[position]["title"]),
                )
              ],
            );
          },
        ),
      ),
    ),
  );
}

void showTapMessage(BuildContext context, String message) {
  var alertDialog = new AlertDialog(
    title: Text(message),
    actions: <Widget>[
      FlatButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text("Ok"),
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
