import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String username;
  final String content;
  final String videoId;
  final String videoTitle;
  final int duration;
  final DateTime createdAt;
  final DateTime updatedAt;


  Post({
    this.id,
    this.username,
    this.content,
    this.videoId,
    this.videoTitle,
    this.duration,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
