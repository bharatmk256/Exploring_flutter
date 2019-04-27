import 'package:flutter/material.dart';
import 'package:nottodo_app/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not To Do',
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
