import 'package:flutter/material.dart';

// TODO: Change to stateless?
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
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[500], width: 0.5)
            )
          ),
          padding: EdgeInsets.only(
            top: 20,
            bottom: 5,
            left: 10,
            right: 10
          ),
          child: Text(
            "PlayLists",
            style: new TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.red,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 1",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.blue,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 2",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.green,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 3",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.yellow,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 4",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.purple,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 5",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[500], width: 0.5)
            )
          ),
          padding: EdgeInsets.only(
            top: 20,
            bottom: 5,
            left: 10,
            right: 10
          ),
          child: Text(
            "Collection",
            style: new TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 210.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.red,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 1",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.blue,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 2",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.green,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 3",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.yellow,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 4",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.purple,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 5",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey[500], width: 0.5)
            )
          ),
          padding: EdgeInsets.only(
            top: 20,
            bottom: 5,
            left: 10,
            right: 10
          ),
          child: Text(
            "Recent",
            style: new TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          )
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: 210.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.red,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 1",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.blue,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 2",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.green,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 3",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.yellow,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 4",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 180.0,
                    color: Colors.purple,
                    height: 180,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    padding: EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5
                    ),
                    child: Text(
                      "List 5",
                      style: new TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0)
              ),
            ],
          ),
        ),
        Container(
          height: 80
        )
      ]),
    );
  }
}
