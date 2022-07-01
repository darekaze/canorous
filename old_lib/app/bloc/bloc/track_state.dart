import 'package:canorous/data/model/Track.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrackState extends Equatable {
  TrackState([List props = const []]) : super(props);
}

class TrackLoading extends TrackState {}

class TrackLoaded extends TrackState {
  final List<Track> tracks;

  TrackLoaded(this.tracks) : super([tracks]);
}