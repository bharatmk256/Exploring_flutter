import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// https://jsonplaceholder.typicode.com/posts

void main() async {
  List _data = await getJson();
  print(_data[0]["title"]);
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Json Parsing"),
          backgroundColor: Colors.redAccent,
        ),
        body: Center(
          child: Text(
            _data[0]["title"]
          ),
        ),
      ),
    ),
  );
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
