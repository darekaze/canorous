import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostSubmitState extends Equatable {
  PostSubmitState([List props = const []]) : super(props);
}

class PostSubmitUninitialized extends PostSubmitState {
  @override
  String toString() => 'PostSubmitUninitialized';
}

class PostSubmitSuccess extends PostSubmitState {
  @override
  String toString() => 'PostSubmitSuccess';
}

class PostSubmitError extends PostSubmitState {
  @override
  String toString() => 'PostSubmitError';
}

class PostSubmitLoading extends PostSubmitState {
  @override
  String toString() => 'PostSubmitLoading';
}