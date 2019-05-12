import 'package:flutter/material.dart';
import 'package:joke_app_oriantation/model/joke.dart';
import 'package:joke_app_oriantation/ui/joke_details.dart';
import 'package:joke_app_oriantation/ui/joke_listing.dart';

class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tabletBreakPoint = 600;
  Joke _selectedJoke;
  Widget _buildMobileLayout() {
    return JokeListing(
      jokeSelectedCallback: (jokeSelected) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return JokeDetails(
                isInTabletLayout: false,
                joke: jokeSelected,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13.0,
            child: JokeListing(
              jokeSelectedCallback: (joke) {
                setState(
                  () {
                    _selectedJoke = joke;
                  },
                );
              },
              jokeSelected: _selectedJoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(
            isInTabletLayout: true,
            joke: _selectedJoke,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait &&
        shortestSide < tabletBreakPoint) {
      //Mobile
      content = _buildMobileLayout();
    } else {
      //Tablet
      content = _buildTabletLayout();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokes"),
      ),
      body: content,
    );
  }
}
