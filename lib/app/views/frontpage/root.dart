import 'package:canorous/app/views/frontpage/home.dart';
import 'package:canorous/app/views/frontpage/search.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  static const String PATH = '/';
  const Root();

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root>
    with SingleTickerProviderStateMixin {
  static const List tabData = [
    {'text': 'Home', 'icon': Icon(Icons.home)},
    {'text': 'Search', 'icon': Icon(Icons.search)},
    {'text': 'Library', 'icon': Icon(Icons.library_books)},
    {'text': 'Moment', 'icon': Icon(Icons.music_video)}
  ];

  TabController _tabController;
  List<Widget> myTabs = [];
  String _appBarTitle = tabData[0]['text'];
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabData.forEach((item) {
      myTabs.add(Tab(
        text: item['text'],
        icon: item['icon'],
      ));
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        // TODO: implement other pages
        HomePage(),
        SearchScreen(),
        Container(
          color: Colors.purple,
        ),
        Container(
          color: Colors.amber,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildTabContent(),
        bottomNavigationBar: SafeArea(
          child: TabBar(
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
      ),
    );
  }
}
