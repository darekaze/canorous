import 'package:canorous/app/components/player.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/app/views/frontpage/home.dart';
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
      backgroundColor: CupertinoColors.darkBackgroundGray,
      activeColor: Colors.cyan[200],
      iconSize: 24.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_video),
          title: Text('Moment'),
        ),
      ],
      onTap: updateView,
    );
  }

  void updateView(int index) {
    setState(() { _currentIndex = index; });
  }
/*
  // TODO: separate as individual component
  Widget _buildMusicBar(BuildContext context) {
    return GestureDetector(
      onTap: (){}, // TODO: direct to player page
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.93),
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade900, width: 1.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Container(), // TODO: add Thumbnail widget
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Now playing title',
                  style: Theme.of(context).textTheme.subhead.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              width: 40.0,
              child: IconButton(
                icon: Icon(Icons.pause),
                onPressed: (){}, // TODO: play and pause function
                iconSize: 35.0,
              ),
            ),
            Container(
              width: 40.0,
              child: IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: (){}, // TODO: next function
                iconSize: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned.fill(child: _buildTabContent()),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: PlayerWidget(url: "http://www2.comp.polyu.edu.hk/~16097874d/test.mp3")
              ),
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
