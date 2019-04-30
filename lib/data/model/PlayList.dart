import 'package:json_annotation/json_annotation.dart';

part 'PlayList.g.dart';

@JsonSerializable()
class PlayList {
  int id; // Auto-gen by SEMBAST
  PlayList({this.title, this.tracksTitle, this.tracksVideoId, this.tracksDuration});

  String title;
  List<String> tracksTitle;
  List<String> tracksVideoId;
  List<int> tracksDuration;


  factory PlayList.fromJson(Map<String, dynamic> json) => _$PlayListFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListToJson(this);
}
