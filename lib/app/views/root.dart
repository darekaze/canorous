import 'package:canorous/app/components/player.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/app/views/frontpage/home.dart';
import 'package:canorous/app/views/frontpage/search.dart';
import 'package:canorous/utils/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  static const String PATH = '/';
  const Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  Widget _buildTabContent() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        // TODO: implement other pages
        HomePage(),
        SearchScreen(appAPI: AppProvider.getAPI(context)),
        Container(
          color: Colors.purple,
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return CupertinoTabBar(
      currentIndex: _currentIndex,
      activeColor: Colors.red[500],
      iconSize: 24.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home', style: TextStyle(fontSize: 12)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search', style: TextStyle(fontSize: 12)),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          title: Text('Moment', style: TextStyle(fontSize: 12)),
        ),
      ],
      onTap: updateView,
    );
  }

  void updateView(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: materialLightTheme,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned.fill(child: _buildTabContent()),
              // TODO: require further change
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: PlayerWidget(
                      url:
                          "http://www2.comp.polyu.edu.hk/~16097874d/test.mp3")),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: _buildTabBar(),
        ),
      ),
    );
  }
}
