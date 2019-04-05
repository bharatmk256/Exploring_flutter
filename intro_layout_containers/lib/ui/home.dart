import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,


      child: new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const Text("Hello There"),
          const Text("Hey Again"),
          const Text("1")
        ],
      ),

      // child: new Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     new Text(
      //       "Item 1",
      //       textDirection: TextDirection.ltr,
      //       style: new TextStyle(fontSize: 20.0),
      //     ),
      //     new Text(
      //       "Item 2",
      //       textDirection: TextDirection.ltr,
      //       style: new TextStyle(fontSize: 20.0),
      //     ),
      //     const Expanded(
      //       child: const Text("Item 3"),
      //     )
      //   ],
      // ),
      // child: new Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     new Text(
      //       "First Item",
      //       textDirection: TextDirection.ltr,
      //       style: new TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //     new Text(
      //       "Second Item",
      //       textDirection: TextDirection.ltr,
      //       style: new TextStyle(
      //         color: Colors.blue,
      //       ),
      //     ),
      //     new Container(
      //       color: Colors.black,
      //       alignment: Alignment.bottomLeft,
      //       child: new Text(
      //         "Third Item",
      //         textDirection: TextDirection.ltr,
      //         style: new TextStyle(
      //           color: Colors.white,
      //           fontSize: 20.0,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      // child: new Text(
      //   "Hello Container",
      //   textDirection: TextDirection.ltr,
      //   style: new TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w900,
      //     fontSize: 18.3,
      //   ),
      // ),
    );
  }
}
