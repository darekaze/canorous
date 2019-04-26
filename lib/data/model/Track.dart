import 'package:json_annotation/json_annotation.dart';

part 'Track.g.dart';

@JsonSerializable()
class Track {
  int id; // Auto-gen by SEMBAST
  Track({this.title, this.videoId, this.duration});

  String title;
  String videoId;
  int duration;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
