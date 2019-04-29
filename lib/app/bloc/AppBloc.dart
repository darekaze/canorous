import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/app/bloc/bloc/bloc.dart';
import 'package:canorous/app/bloc/playlist/bloc.dart';
import 'package:canorous/app/bloc/post/bloc.dart';
import 'package:canorous/app/bloc/search/bloc.dart';

class AppBloc {
  final AppAPI appAPI;
  SearchBloc _searchBloc;
  PostBloc _postBloc;
  PlaylistBloc _playlistBloc;
  TrackBloc _trackBloc;


  AppBloc(this.appAPI) {
    _searchBloc = SearchBloc(appAPI: appAPI);
    _postBloc = PostBloc(appAPI: appAPI);
    _playlistBloc = PlaylistBloc();
    _trackBloc = TrackBloc();
    // listener..
  }

  SearchBloc get searchBloc => _searchBloc;
  PostBloc get postBloc => _postBloc;
  PlaylistBloc get playlistBloc => _playlistBloc;
  TrackBloc get trackBloc => _trackBloc;
}