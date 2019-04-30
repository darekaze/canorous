import 'package:cached_network_image/cached_network_image.dart';
import 'package:canorous/app/bloc/bloc/bloc.dart';
import 'package:canorous/app/bloc/playlist/bloc.dart';
import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/app/views/PostPage.dart';
import 'package:canorous/data/model/PlayList.dart';
import 'package:canorous/data/model/Track.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[500], width: 0.5))),
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "PlayLists",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.add),
                  iconSize: 30,
                  color: Colors.red[500],
                  onPressed: () {
                    TextEditingController textController =
                        TextEditingController();
                    showDialog<Null>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  labelText: 'Please enter a name',
                                ),
                                controller: textController,
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text('Confirm'),
                                    onPressed: () {
                                      AppProvider.getBloc(context)
                                          .playlistBloc
                                          .dispatch(CreatePlayList(PlayList(
                                              title: textController.text,
                                              tracksTitle: [],
                                              tracksVideoId: [],
                                              tracksDuration: [])));
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            )),
        _PlayList(
          playlistBloc: AppProvider.getBloc(context).playlistBloc,
        ),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[500], width: 0.5))),
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Records",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.clear),
                  color: Colors.red[500],
                  iconSize: 30,
                  onPressed: () {
                    AppProvider.getBloc(context)
                        .trackBloc
                        .dispatch(ClearRecords());
                  },
                ),
              ],
            )),
        _Records(
          trackBloc: AppProvider.getBloc(context).trackBloc,
        ),
        Container(height: 80)
      ]),
    );
  }
}

class _PlayList extends StatefulWidget {
  final PlaylistBloc playlistBloc;

  _PlayList({this.playlistBloc});
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<_PlayList> {
  @override
  void initState() {
    super.initState();
    widget.playlistBloc.dispatch(LoadPlayLists());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 230.0,
      child: BlocBuilder(
        bloc: widget.playlistBloc,
        builder: (BuildContext context, PlaylistState state) {
          if (state is PlayListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PlayListLoaded) {
            if (state.playLists.length == 0) {
              widget.playlistBloc.dispatch(CreatePlayList(PlayList(
                  title: "My PlayList",
                  tracksTitle: [],
                  tracksVideoId: [],
                  tracksDuration: [])));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: state.playLists.length,
              itemBuilder: (context, index) {
                final displayedPlayList = state.playLists[index];
                var image1 = CachedNetworkImageProvider(
                    'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                var image2 = CachedNetworkImageProvider(
                    'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                var image3 = CachedNetworkImageProvider(
                    'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                var image4 = CachedNetworkImageProvider(
                    'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                if (displayedPlayList.tracksVideoId.length > 0) {
                  image1 = CachedNetworkImageProvider(
                      'https://i.ytimg.com/vi/${displayedPlayList.tracksVideoId[0]}/mqdefault.jpg' ??
                          'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                }
                if (displayedPlayList.tracksVideoId.length > 1) {
                  image2 = CachedNetworkImageProvider(
                      'https://i.ytimg.com/vi/${displayedPlayList.tracksVideoId[1]}/mqdefault.jpg' ??
                          'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                }
                if (displayedPlayList.tracksVideoId.length > 2) {
                  image3 = CachedNetworkImageProvider(
                      'https://i.ytimg.com/vi/${displayedPlayList.tracksVideoId[2]}/mqdefault.jpg' ??
                          'http://www2.comp.polyu.edu.hk/~16097874d/default.jpg');
                }
                if (displayedPlayList.tracksVideoId.length > 3) {
                  image4 = CachedNetworkImageProvider(
                      'https://i.ytimg.com/vi/${displayedPlayList.tracksVideoId[3]}/mqdefault.jpg' ??
                          'http://www2.comp.polyu.edu.hk/~16097874d/default.png');
                }
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 180,
                          height: 180,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: image1,
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: image2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: image3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: image4,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          showDialog<Null>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return _Tracks(
                                    playList: displayedPlayList,
                                    playlistBloc: widget.playlistBloc);
                              });
                        },
                        onLongPress: () {
                          showDialog<Null>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    child: Text("Are you sure to delete " +
                                        (displayedPlayList.title == null
                                            ? "Default"
                                            : displayedPlayList.title)),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        FlatButton(
                                          child: Text('Confirm'),
                                          onPressed: () {
                                            widget.playlistBloc.dispatch(
                                                DeletePlayList(
                                                    displayedPlayList));
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        FlatButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 180,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          child: Text(
                            displayedPlayList.title == null
                                ? "Default"
                                : displayedPlayList.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14.0),
                          ))
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class _Tracks extends StatefulWidget {
  final PlayList playList;
  final PlaylistBloc playlistBloc;

  _Tracks({this.playList, this.playlistBloc});
  @override
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<_Tracks> {
  IconData share = const IconData(0xf473,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

  @override
  void initState() {
    super.initState();
    //_playListBloc.dispatch(CreatePlayList(demo));
    widget.playlistBloc.dispatch(LoadPlayLists());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
          width: 400,
          height: 200,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: widget.playList.tracksTitle.length,
            itemBuilder: (context, index) {
              final displayedTrack = widget.playList.tracksTitle[index];
              return ListTile(
                title:
                    Text(displayedTrack == null ? "Default" : displayedTrack),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(share),
                      onPressed: () {
                        AppProvider.getRouter(context).navigateTo(
                          context,
                          PostPage.generatePath(
                              widget.playList.tracksVideoId[index],
                              widget.playList.tracksTitle[index]),
                          transition: TransitionType.inFromRight,
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.delete),
                      onPressed: () {
                        widget.playlistBloc.dispatch(DeleteTrack(
                            widget.playList,
                            Track(
                                title: widget.playList.tracksTitle[index],
                                videoId: widget.playList.tracksVideoId[index],
                                duration:
                                    widget.playList.tracksDuration[index])));
                        Navigator.of(context).pop(); // enhancement need
                      },
                    ),
                  ],
                ),
              );
            },
          )),
      actions: <Widget>[
        FlatButton(
          child: Text('Play'),
          onPressed: () {
            AppProvider.getPlayer(context).playList(
                widget.playList.tracksVideoId, widget.playList.tracksTitle);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _Records extends StatefulWidget {
  final TrackBloc trackBloc;

  _Records({this.trackBloc});

  @override
  __RecordsState createState() => __RecordsState();
}

class __RecordsState extends State<_Records> {
  @override
  void initState() {
    super.initState();
    //_playListBloc.dispatch(CreatePlayList(demo));
    widget.trackBloc.dispatch(LoadTracks());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      height: 230.0,
      child: BlocBuilder(
        bloc: widget.trackBloc,
        builder: (BuildContext context, TrackState state) {
          if (state is TrackLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TrackLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: state.tracks.length,
              itemBuilder: (context, index) {
                final displayedTrack = state.tracks[index];
                var image = CachedNetworkImageProvider(
                    'https://i.ytimg.com/vi/${displayedTrack.videoId}/mqdefault.jpg' ??
                        'http://www2.comp.polyu.edu.hk/~16097874d/default.jng');
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: image)),
                        ),
                        onTap: () {
                          AppProvider.getPlayer(context).playFromYT(
                              displayedTrack.videoId, displayedTrack.title);
                        },
                      ),
                      Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 180,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          child: Text(
                            displayedTrack.title == null
                                ? "Default"
                                : displayedTrack.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14.0),
                          ))
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
