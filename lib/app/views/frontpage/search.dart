import 'package:cached_network_image/cached_network_image.dart';
import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/api/model/SearchResult.dart';
import 'package:canorous/app/bloc/search/bloc.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/data/dao/TrackDao.dart';
import 'package:canorous/data/model/Track.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class SearchScreen extends StatefulWidget {
  final AppAPI appAPI;

  const SearchScreen({
    Key key,
    @required this.appAPI,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc(
      appAPI: widget.appAPI,
    );
  }

  @override
  void dispose() {
    _searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ENHANCE: Change into stack and make searchbar float
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _SearchBar(searchBloc: _searchBloc),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          _SearchBody(searchBloc: _searchBloc),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _SearchBar extends StatefulWidget {
  final SearchBloc searchBloc;
  _SearchBar({Key key, this.searchBloc}) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();

  SearchBloc get searchBloc => widget.searchBloc;

  void _onClearTapped() {
    _textController.text = '';
    searchBloc.dispatch(TextChanged(text: ''));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text) {
        searchBloc.dispatch(
          TextChanged(text: text),
        );
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          child: Icon(Icons.clear),
          onTap: _onClearTapped,
        ),
        border: InputBorder.none,
        hintText: 'Search music',
        contentPadding: EdgeInsets.only(top: 15.0),
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  final SearchBloc searchBloc;

  const _SearchBody({Key key, this.searchBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: searchBloc,
      builder: (BuildContext context, SearchState state) {
        if (state is SearchStateEmpty) {
          return Center(child: Text('Enter a term to begin'));
        }
        if (state is SearchStateLoading) {
          return Center(
              child:
                  CircularProgressIndicator()); // Can be change to cooler one
        }
        if (state is SearchStateError) {
          return Center(child: Text(state.error));
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
              ? Center(child: Text('No Results'))
              : Expanded(child: _SearchResults(items: state.items));
        }
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<SearchResultItem> items;

  const _SearchResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (t) {
        if (t is UserScrollNotification) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _SearchResultItem(item: items[index]);
        },
      ),
    );
  }
}

class _SearchResultItem extends StatefulWidget {
  final SearchResultItem item;

  const _SearchResultItem({Key key, @required this.item}) : super(key: key);

  @override
  State<_SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<_SearchResultItem>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  IconData share = const IconData(
    0xf473, 
    fontFamily: CupertinoIcons.iconFont, 
    fontPackage: CupertinoIcons.iconFontPackage
  );

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = Tween(begin: 1.0, end: 0.5).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImageProvider(
        'https://i.ytimg.com/vi/${widget.item.videoId}/mqdefault.jpg' ??
            'nothing');
    image.resolve(ImageConfiguration()).addListener((imageInfo, syncCall) {
      if (mounted) controller.forward();
    });
    return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return GestureDetector(
            onTap: () {
              TrackDao().insert(Track(
                title: widget.item.title,
                videoId: widget.item.videoId,
                duration: widget.item.lengthSeconds,
              ));
              print('Music added to track store: ${widget.item.videoId}');
              AppProvider.getPlayer(context).playFromYT(widget.item.videoId);
            },
            child: Card(
              color: Colors.transparent,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: image,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(animation.value),
                      BlendMode.hardLight,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 16.0, right: 4.0),
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.item.publishedText,
                              style: TextStyle(color: Colors.white)
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                iconSize: 24,
                                icon: Icon(CupertinoIcons.bookmark),
                                color: CupertinoColors.activeGreen,
                                onPressed: () {
                                  
                                },
                              ),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(share),
                                color: CupertinoColors.activeGreen,
                                onPressed: () {
                                  
                                },
                              ),
                              // ENHANCE: More buttons
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${_printDuration(Duration(seconds: widget.item.lengthSeconds))}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
