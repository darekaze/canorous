import 'package:canorous/app/bloc/playlist/bloc.dart';
import 'package:canorous/data/model/PlayList.dart';
import 'package:canorous/data/model/Track.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 bool refresh = false;

// TODO: Change to stateless?
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PlaylistBloc _playListBloc = PlaylistBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        _PlayList(),
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


class _PlayList extends StatefulWidget {
  
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<_PlayList> {
  PlaylistBloc _playListBloc = PlaylistBloc();
  
  @override
  void initState() {
    super.initState();
    _playListBloc.dispatch(LoadPlayLists());
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        height: 210.0,
        child: BlocBuilder(
          bloc: _playListBloc,
          builder: (BuildContext context, PlaylistState state) {
            if (state is PlayListLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PlayListLoaded) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: state.playLists.length,
                itemBuilder: (context, index) {
                  final displayedPlayList = state.playLists[index];
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            width: 180.0,
                            color: Colors.green,
                            height: 180,
                          ),
                          onTap: () {
                            showDialog<Null>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return _Tracks(playList: displayedPlayList);
                              }
                            );
                          },
                          onLongPress: () {
                            showDialog<Null>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    child: Text("Are you sure to delete " + (displayedPlayList.title == null ? "Default" : displayedPlayList.title)),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new FlatButton(
                                          child: Text('Confirm'),
                                          onPressed: () {
                                            _playListBloc.dispatch(DeletePlayList(displayedPlayList));
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new FlatButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                          },
                          onDoubleTap: (){
                            TextEditingController textController = TextEditingController();
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new FlatButton(
                                          child: Text('Confirm'),
                                          onPressed: () {
                                            _playListBloc.dispatch(CreatePlayList(PlayList(title: textController.text, tracksTitle: [], tracksVideoId: [], tracksDuration: [])));
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new FlatButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                            );
                          }
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
                            displayedPlayList.title == null ? "Default" : displayedPlayList.title,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        )
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

  _Tracks({this.playList});
  @override
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<_Tracks> {
  PlaylistBloc _playListBloc = PlaylistBloc();

  @override
  void initState() {
    super.initState();
    //_playListBloc.dispatch(CreatePlayList(demo));
    _playListBloc.dispatch(LoadPlayLists());
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
                    title: Text(displayedTrack == null ? "Default" : displayedTrack),
                    trailing: IconButton(
                      icon: Icon(CupertinoIcons.delete),
                      onPressed: (){
                        _playListBloc.dispatch(DeleteTrack(widget.playList, Track(title: widget.playList.tracksTitle[index], videoId: widget.playList.tracksVideoId[index], duration: widget.playList.tracksDuration[index])));
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
        )
      ),
      actions: <Widget>[
        new FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}