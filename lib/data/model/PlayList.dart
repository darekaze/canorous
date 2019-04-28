import 'package:canorous/data/model/Track.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PlayList.g.dart';

@JsonSerializable()
class PlayList {
  int id; // Auto-gen by SEMBAST
  PlayList({this.title, this.tracks});

  String title;
  List <Track> tracks;

  factory PlayList.fromJson(Map<String, dynamic> json) => _$PlayListFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListToJson(this);
}
