import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void _onPress() {
    print("Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        title: new Text(
          "Fency Day",
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.send),
            onPressed: () => debugPrint(
                  "Icon Tapped",
                ),
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: _onPress,
          ),
        ],
      ),
      // main screen other properties
      backgroundColor: Colors.grey.shade100,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Bonni",
              style: new TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.w400,
                color: Colors.deepOrange,
              ),
            ),
            new InkWell(
              child: new Text(
                "Button!",
              ),
              onTap: () => debugPrint(
                    "ontapped",
                  ),
            ),
          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: ()=> debugPrint("Don't press Do Code :|"),
        backgroundColor: Colors.greenAccent,
        tooltip: "Opps!",
        child: new Icon(Icons.code),
      ),

      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: Text("Home"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.gamepad),
            title: Text("Games"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.tv),
            title: Text("Live TV"),
          ),
        ],
        onTap: (int i) => debugPrint("Umm $i"),
      ),
    );
  }
}
