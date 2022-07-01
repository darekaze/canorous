import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:canorous/data/dao/PlayListDao.dart';
import './bloc.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlayListDao _playListDao = PlayListDao();

  @override
  PlaylistState get initialState => PlayListLoading();

  @override
  Stream<PlaylistState> mapEventToState(
    PlaylistEvent event,
  ) async* {
    if (event is LoadPlayLists) {
      yield PlayListLoading();
      yield* _reloadPlayLists();
    } else if (event is CreatePlayList) {
      await _playListDao.create(event.playList);
      yield* _reloadPlayLists();
    } else if (event is DeletePlayList)  {
      await _playListDao.delete(event.playList);
      yield* _reloadPlayLists();
    } else if (event is InsertTrack) {
      await _playListDao.insertTrack(event.playList, event.track);
      yield* _reloadPlayLists();
    } else if (event is DeleteTrack) {
      await _playListDao.deleteTrack(event.playList, event.track);
      yield* _reloadPlayLists();
    }
  }

  Stream<PlaylistState> _reloadPlayLists() async* {
    final playLists = await _playListDao.getAllStoredByName();

    yield PlayListLoaded(playLists);
  }
}
