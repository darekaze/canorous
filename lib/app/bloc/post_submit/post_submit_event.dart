import 'package:canorous/api/model/Post.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostSubmitEvent extends Equatable {
  PostSubmitEvent([List props = const []]) : super(props);
}


class SubmitPost extends PostSubmitEvent {
  final Post post;

  SubmitPost(this.post) : super([post]);

  @override
  String toString() => 'PostSubmit({post: $post})';
}