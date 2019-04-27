import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

// TODO: change base on the real api
@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
