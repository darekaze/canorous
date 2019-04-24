// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SearchResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) {
  return SearchResultItem(
      type: json['type'] as String,
      title: json['title'] as String,
      videoId: json['videoId'] as String,
      publishedText: json['publishedText'] as String,
      viewCount: json['viewCount'] as int,
      published: json['published'] as int,
      lengthSeconds: json['lengthSeconds'] as int,
      liveNow: json['liveNow'] as bool,
      paid: json['paid'] as bool,
      premium: json['premium'] as bool);
}

Map<String, dynamic> _$SearchResultItemToJson(SearchResultItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'videoId': instance.videoId,
      'publishedText': instance.publishedText,
      'viewCount': instance.viewCount,
      'published': instance.published,
      'lengthSeconds': instance.lengthSeconds,
      'liveNow': instance.liveNow,
      'paid': instance.paid,
      'premium': instance.premium
    };

SearchResultError _$SearchResultErrorFromJson(Map<String, dynamic> json) {
  return SearchResultError(error: json['error'] as String);
}

Map<String, dynamic> _$SearchResultErrorToJson(SearchResultError instance) =>
    <String, dynamic>{'error': instance.error};
