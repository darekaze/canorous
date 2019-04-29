import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/app/views/frontpage/home.dart';
import 'package:canorous/app/views/frontpage/moment.dart';
import 'package:canorous/app/views/frontpage/search.dart';
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
  IconData moment = const IconData(
    0xf37c, 
    fontFamily: CupertinoIcons.iconFont, 
    fontPackage: CupertinoIcons.iconFontPackage
  );
  IconData search = const IconData(
    0xf4a4, 
    fontFamily: CupertinoIcons.iconFont, 
    fontPackage: CupertinoIcons.iconFontPackage
  );
  IconData home = const IconData(
    0xf448, 
    fontFamily: CupertinoIcons.iconFont, 
    fontPackage: CupertinoIcons.iconFontPackage
  );

  Widget _buildTabContent() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        HomeScreen(),
        SearchScreen(),
        MomentScreen(postBloc: AppProvider.getBloc(context).postBloc),
      ],
    );
  }

  Widget _buildTabBar() {
    return CupertinoTabBar(
      currentIndex: _currentIndex,
      activeColor: Colors.red[500],
      backgroundColor: Colors.white,
      iconSize: 24.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(home),
          title: Text('Home', style: TextStyle(fontSize: 11)),
        ),
        BottomNavigationBarItem(
          icon: Icon(search),
          title: Text('Search', style: TextStyle(fontSize: 11)),
        ),
        BottomNavigationBarItem(
          icon: Icon(moment),
          title: Text('Moment', style: TextStyle(fontSize: 11)),
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: _buildTabContent()),
            // ENHANCE: Planned further change
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppProvider.getPlayer(context), // here
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: _buildTabBar(),
      ),
    );
  }
}
