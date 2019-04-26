import 'package:equatable/equatable.dart';

// TODO: change base on the real api
class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({
    this.id,
    this.title,
    this.body,
  }) : super([id, title, body]);

  @override
  String toString() => 'Post { id : $id }';
}
