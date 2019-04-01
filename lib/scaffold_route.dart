import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  PageController _pageController;
  int _currentIndex = 0;

  List<Widget> _tabList = [
    // Temporaty component
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.amber,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      keepPage: true,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int page) {
    _pageController.jumpToPage(page);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
      ),
      body: PageView(
        children: _tabList,
        onPageChanged: _onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Library'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text('Moment'),
          ),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
