import 'package:canorous/data/model/PlayList.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PlaylistState extends Equatable {
  PlaylistState([List props = const []]) : super(props);
}

class PlayListLoading extends PlaylistState {}

class PlayListLoaded extends PlaylistState {
  final List<PlayList> playLists;

  PlayListLoaded(this.playLists) : super([playLists]);
}
