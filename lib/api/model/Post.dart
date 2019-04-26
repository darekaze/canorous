import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

class Post {
  final List<PostItem> items;

  const Post({this.items});

  static Post fromJson(List<dynamic> list) {
    final items = list
        .map((dynamic item) =>
            PostItem.fromJson(item as Map<String, dynamic>))
        .toList();
    return Post(items: items);
  }
}

// TODO: change base on the real api
@JsonSerializable()
class PostItem {
  final int id;
  final String title;
  final String body;

  PostItem({
    this.id,
    this.title,
    this.body,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) =>
      _$PostItemFromJson(json);
  Map<String, dynamic> toJson() => _$PostItemToJson(this);
}
