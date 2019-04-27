import 'package:flutter/material.dart';
import 'package:nottodo_app/ui/notodo_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Not To Do"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: new NoToDoScreen(),
    );
  }
}
