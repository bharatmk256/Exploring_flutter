import 'package:flutter/material.dart';
import 'package:login_app/ui/custom_login_form.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Login";
    return MaterialApp(
      title:  appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          // centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey,
        body: CustomLoginForm(),
      ),
    );
  }
}
