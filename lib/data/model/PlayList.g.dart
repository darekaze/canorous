// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayList _$PlayListFromJson(Map<String, dynamic> json) {
  return PlayList(
      title: json['title'] as String,
      tracksTitle:
          (json['tracksTitle'] as List)?.map((e) => e as String)?.toList(),
      tracksVideoId:
          (json['tracksVideoId'] as List)?.map((e) => e as String)?.toList(),
      tracksDuration:
          (json['tracksDuration'] as List)?.map((e) => e as int)?.toList())
    ..id = json['id'] as int;
}

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tracksTitle': instance.tracksTitle,
      'tracksVideoId': instance.tracksVideoId,
      'tracksDuration': instance.tracksDuration
    };
