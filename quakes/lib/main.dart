import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

//https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson
Map _quakes;
List _features; // features objects list
void main() async {
  _quakes = await getQuakes();
  _features = _quakes["features"];
  // print(_quakes["features"][0]["properties"]);

  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quakes",
      home: new Quakes(),
    ),
  );
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Quakes'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new Center(
        child: new ListView.builder(
          itemCount: _features.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd) return new Divider();
            final index = position ~/
                2; // We are dividing position by 2 and returning an integer result
            var format = new DateFormat.yMMMMd("en_US").add_jm();

            var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(
                _features[index]["properties"]["time"] * 1000,
                isUtc: true));

            // creating the rows for out list view
            return new ListTile(
              title: new Text(
                "At: $date",
                style: new TextStyle(
                  fontSize: 19.5,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: new Text(
                "${_features[index]["properties"]["place"]}",
                style: new TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: new CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: new Text(
                  "${_features[index]["properties"]["mag"]}",
                  style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                _showAlertMessage(context, "${_features[index]["properties"]["title"]}");
              },
            );
          },
        ),
      ),
    );
  }

  void _showAlertMessage(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: new Text("Quakes"),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },child: new Text("Ok"),
        )
      ],
    );
    showDialog(context: context,child: alert);
  }
}

Future<Map> getQuakes() async {
  String apiURL =
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";
  http.Response response = await http.get(apiURL);
  return json.decode(response.body);
}
