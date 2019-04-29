import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:canorous/api/AppAPI.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class PostSubmitBloc extends Bloc<PostSubmitEvent, PostSubmitState> {
  final AppAPI appAPI;

  PostSubmitBloc({@required this.appAPI})
      : assert(appAPI != null);

  @override
  PostSubmitState get initialState => PostSubmitUninitialized();

  @override
  Stream<PostSubmitState> mapEventToState(
    PostSubmitEvent event,
  ) async* {
    if (event is SubmitPost) {
      yield PostSubmitLoading();
      try {
        await appAPI.submitPost(event.post);
        yield PostSubmitSuccess();
      } catch(_) {
        yield PostSubmitError();
      }
    }
  }
}
