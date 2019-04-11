import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Text("1:"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                width: 150.0,
                color: Colors.blue,
              ),
              Container(
                width: 150.0,
                color: Colors.green,
              ),
              Container(
                width: 150.0,
                color: Colors.yellow,
              ),
              Container(
                width: 150.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        Text("2:"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                width: 150.0,
                color: Colors.blue,
              ),
              Container(
                width: 150.0,
                color: Colors.green,
              ),
              Container(
                width: 150.0,
                color: Colors.yellow,
              ),
              Container(
                width: 150.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        Text("3:"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                width: 150.0,
                color: Colors.blue,
              ),
              Container(
                width: 150.0,
                color: Colors.green,
              ),
              Container(
                width: 150.0,
                color: Colors.yellow,
              ),
              Container(
                width: 150.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        Text("4:"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                width: 150.0,
                color: Colors.blue,
              ),
              Container(
                width: 150.0,
                color: Colors.green,
              ),
              Container(
                width: 150.0,
                color: Colors.yellow,
              ),
              Container(
                width: 150.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        Text("5:"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                width: 150.0,
                color: Colors.blue,
              ),
              Container(
                width: 150.0,
                color: Colors.green,
              ),
              Container(
                width: 150.0,
                color: Colors.yellow,
              ),
              Container(
                width: 150.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        Text("6:"),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 150.0,
                color: Colors.red,
              ),
              Container(
                width: 150.0,
                color: Colors.blue,
              ),
              Container(
                width: 150.0,
                color: Colors.green,
              ),
              Container(
                width: 150.0,
                color: Colors.yellow,
              ),
              Container(
                width: 150.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
