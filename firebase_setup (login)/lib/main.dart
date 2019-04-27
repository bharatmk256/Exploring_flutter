import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth-Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Board"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text("Google Signin"),
                onPressed: () => _gSignIn(),
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text("Signin With Email"),
                color: Colors.orange,
                onPressed: () => _signInWithEmail(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text("Create Account"),
                color: Colors.purple,
                onPressed: () => _createUser(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.blueGrey,
                child: Text("Signout"),
                onPressed: () => _logout(),
              ),
            ),
            new Image.network(_imageUrl == null || _imageUrl.isEmpty
                ? "https://picsum.photos/250?image=9"
                : _imageUrl),
          ],
        ),
      ),
    );
  }

  Future<FirebaseUser> _gSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in ${user.photoUrl}");
    setState(() {
      _imageUrl = user.photoUrl;
    });
    return user;
  }

  Future _createUser() async {
    FirebaseUser user = await _auth
        .createUserWithEmailAndPassword(
      email: "bharatmk@gmail.com",
      password: "bharatmk257",
    )
        .then((user) {
      print("User is created: ${user.displayName}");
      print("Email: ${user.email}");
    });
  }

  _logout() {
    setState(() {
      _googleSignIn.signOut();
      _imageUrl = null;
    });
  }

  _signInWithEmail() {
    _auth
        .signInWithEmailAndPassword(
            email: "bharatmk@gmail.com", password: "bharatmk257")
        .catchError((error) {
      print("Something went wrong: ${error.toString()}");
    }).then((newUser) {
      print("User Signed In: ${newUser.email}");
    });
  }
}
