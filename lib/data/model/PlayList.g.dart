// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlayList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayList _$PlayListFromJson(Map<String, dynamic> json) {
  return PlayList(
      title: json['title'] as String,
      tracks: (json['tracks'] as List)
          ?.map((e) =>
              e == null ? null : Track.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..id = json['id'] as int;
}

Map<String, dynamic> _$PlayListToJson(PlayList instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'tracks': instance.tracks
    };
