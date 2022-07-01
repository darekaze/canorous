import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:canorous/data/dao/TrackDao.dart';
import './bloc.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackDao _trackDao = TrackDao();

  @override
  TrackState get initialState => TrackLoading();

  @override
  Stream<TrackState> mapEventToState(
    TrackEvent event,
  ) async* {
    if (event is LoadTracks) {
      yield TrackLoading();
      yield* _reloadTracks();
    } else if (event is CreateRecord) {
      await _trackDao.create(event.track);
      yield* _reloadTracks();
    } else if (event is DeleteRecord) {
      await _trackDao.delete(event.track);
      yield* _reloadTracks();
    } else if (event is ClearRecords) {
      await _trackDao.clear();
      yield* _reloadTracks();
    }
  }


  Stream<TrackState> _reloadTracks() async* {
    final tracks = await _trackDao.getAllStoredByName();

    yield TrackLoaded(tracks);
  }
}
