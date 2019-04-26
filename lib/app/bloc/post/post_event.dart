import 'package:canorous/api/model/Post.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostEvent extends Equatable {
  PostEvent([List props = const []]) : super(props);
}

class FetchPosts extends PostEvent {
  @override
  String toString() => 'Fetch Posts';
}

class SendPost extends PostEvent {
  final Post post;

  SendPost(this.post) : super([post]);

  @override
  String toString() => 'SendPost { post: $post }';
}
