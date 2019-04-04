import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Text("1:"),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5.0),
                  height: 150.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Text("2:"),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5.0),
                  height: 150.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Text("3:"),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5.0),
                  height: 150.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Text("4:"),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5.0),
                  height: 150.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Text("5:"),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5.0),
                  height: 150.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
                Text("6:"),
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 5.0),
                  height: 150.0,
                  child: new ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new Container(
                        width: 150.0,
                        color: Colors.red,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.blue,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.green,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.yellow,
                      ),
                      new Container(
                        width: 150.0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ]
            ),
    );
  }
}