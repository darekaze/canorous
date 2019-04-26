// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) {
  return Track(
      title: json['title'] as String,
      videoId: json['videoId'] as String,
      duration: json['duration'] as int)
    ..id = json['id'] as int;
}

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'videoId': instance.videoId,
      'duration': instance.duration
    };
