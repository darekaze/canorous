import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:canorous/api/AppAPI.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AppAPI appAPI;

  PostBloc({@required this.appAPI});

  @override
  Stream<PostState> transform(events, next) {
    return super.transform(
      (events as Observable<PostEvent>).debounce(Duration(milliseconds: 500)),
      next,
    );
  }

  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPosts && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await appAPI.fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
        } else if (currentState is PostLoaded) {
          final posts = await appAPI.fetchPosts(
              (currentState as PostLoaded).posts.length, 20);
          yield posts.isEmpty
              ? (currentState as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: (currentState as PostLoaded).posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;
}
