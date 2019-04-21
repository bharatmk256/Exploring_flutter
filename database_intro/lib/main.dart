import 'package:database_intro/models/user.dart';
import 'package:database_intro/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

List _users;

void main() async {
  var db = new DatabaseHelper();
  //Add user
  // await db.saveUser(new User("Thor", "stormbreaker"));

  int count = await db.getCount();
  print("Count: $count");

  // Retrieving a user
  // User Bharat = await db.getUser(1);
  // User BharatUpdated = User.fromMap(
  //     {"username": "UpdatedBharat", "password": "UpdatedPassword", "id": 1});
  //Update
  // await db.updateUser(BharatUpdated);

  // Delete A User
  // int userDeleted = await db.deleteUser(9);

  // print("Delete $userDeleted");

  // Get all users;
  _users = await db.getAllUsers();
  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("Username: ${user.username}, User Id: ${user.id}");
  }

  runApp(
    new MaterialApp(
      home: new Home(),
      title: "Database",
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: new ListView.builder(
        itemCount: _users.length,
        itemBuilder: (_, int position) {
          return new Card(
            color: Colors.white,
            elevation: 2.0,
            child: new ListTile(
              leading: new CircleAvatar(
                child: new Text(
                    "${User.fromMap(_users[position]).username.substring(0, 1).toUpperCase()}"),
              ),
              title:
                  new Text("User: ${User.fromMap(_users[position]).username}"),
              subtitle: new Text("Id: ${User.fromMap(_users[position]).id}"),
              onTap: () =>
                  debugPrint("${User.fromMap(_users[position]).password}"),
            ),
          );
        },
      ),
    );
  }
}
