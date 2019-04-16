import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../util/utils.dart' as util;

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String _cityEnterd;

  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
        builder: (BuildContext context) {
          return new ChangeCity();
        },
      ),
    );
    if (results != null && results.containsKey("enter")) {
      // print(results["enter"].toString());
      _cityEnterd = results["enter"];
    }
  }

  void showStuff() async {
    Map data = await getWeather(util.appId, util.defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weather"),
        backgroundColor: Colors.red,
        // centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              _goToNextScreen(context);
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              "images/umbrella.png",
              width: 1490.0,
              height: 11200.0,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 20.9, 0.0),
            child: new Text(
              "${_cityEnterd == null ? util.defaultCity : _cityEnterd}",
              style: cityStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset("images/light_rain.png"),
          ),
          updateTempWidget(
              "${_cityEnterd == null ? util.defaultCity : _cityEnterd}"),
          // new Container(
          //   // margin: const EdgeInsets.fromLTRB(30.0, 350.0, 0.0, 0.0),
          //   child: updateTempWidget(
          //       "${_cityEnterd == null ? util.defaultCity : _cityEnterd}"),
          // ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async {
    String apiUrl =
        "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}&units=metric";

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return new FutureBuilder(
      future: getWeather(util.appId, city == null ? util.defaultCity : city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        //where we get all of the info || json data, we setup widgets etc.
        if (snapshot.hasData) {
          Map content = snapshot.data;
          return new Container(
            margin: const EdgeInsets.fromLTRB(30.0, 200.0, 0.0, 0.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ListTile(
                  title: new Text(
                    content["main"]["temp"].toString() + " C",
                    style: new TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 49.9,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  subtitle: new ListTile(
                    title: new Text(
                      "Humidity: ${content['main']['humidity'].toString()} %\n"
                          "Min: ${content['main']['temp_min'].toString()} C\n"
                          "Max: ${content['main']['temp_max'].toString()} C",
                      style: extraData(),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return new Container();
        }
      },
    );
  }
}

class ChangeCity extends StatelessWidget {
  var _cityFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("City"),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
              "images/white_snow.png",
              width: 1490.0,
              height: 11200.0,
              fit: BoxFit.fill,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Enter City",
                  ),
                  controller: _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      {
                        "enter": _cityFieldController.text,
                      },
                    );
                  },
                  color: Colors.red,
                  child: new Text(
                    "Get Weather",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle extraData() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontSize: 17.0,
  );
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9,
  );
}
