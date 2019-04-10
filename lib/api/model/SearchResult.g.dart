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
      lengthSeconds: json['lengthSeconds'] as int);
}

Map<String, dynamic> _$SearchResultItemToJson(SearchResultItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'videoId': instance.videoId,
      'publishedText': instance.publishedText,
      'viewCount': instance.viewCount,
      'lengthSeconds': instance.lengthSeconds
    };
