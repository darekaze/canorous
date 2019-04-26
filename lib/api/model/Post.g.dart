// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostItem _$PostItemFromJson(Map<String, dynamic> json) {
  return PostItem(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String);
}

Map<String, dynamic> _$PostItemToJson(PostItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body
    };
