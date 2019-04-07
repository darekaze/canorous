import 'package:flutter/material.dart';
import 'package:canorous/app/views/frontpage/home.dart';

class Root extends StatefulWidget {
  static const String PATH = '/';

  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  PageController _pageController;
  List<Widget> _pageList;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      keepPage: true,
      initialPage: 0,
    );
    _pageList = [
      // Place the actual screen here (should be loaded async)
      HomePage(),
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
      ),
      body: PageView(
        children: _pageList,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
        onTap: (int index) {
          _currentIndex = index;
          _pageController.jumpToPage(_currentIndex);
        },
      ),
    );
  }
}
