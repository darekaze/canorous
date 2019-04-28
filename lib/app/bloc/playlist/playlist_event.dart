import 'package:canorous/data/model/PlayList.dart';
import 'package:canorous/data/model/Track.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PlaylistEvent extends Equatable {
  PlaylistEvent([List props = const []]) : super(props);
}

class LoadPlayLists extends PlaylistEvent {}

class CreatePlayList extends PlaylistEvent {
  final PlayList playList;

  CreatePlayList(this.playList) : super([playList]);
}

class InsertTrack extends PlaylistEvent {
  final PlayList playList;
  final Track track;

  InsertTrack(this.playList, this.track) : super([playList, track]);
}

class DeleteTrack extends PlaylistEvent {
  final PlayList playList;
  final Track track;

  DeleteTrack(this.playList, this.track) : super([playList, track]);
}

class DeletePlayList extends PlaylistEvent {
  final PlayList playList;

  DeletePlayList(this.playList) : super([playList]);
}
