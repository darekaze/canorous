import 'package:canorous/data/model/Track.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TrackEvent extends Equatable {
  TrackEvent([List props = const []]) : super(props);
}

class LoadTracks extends TrackEvent {}

class CreateRecord extends TrackEvent {
  final Track track;

  CreateRecord(this.track) : super([track]);
}

class DeleteRecord extends TrackEvent {
  final Track track;

  DeleteRecord(this.track) : super([track]);
}

class ClearRecords extends TrackEvent {}