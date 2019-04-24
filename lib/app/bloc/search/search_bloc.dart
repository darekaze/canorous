import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/api/model/SearchResult.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AppAPI appAPI;

  SearchBloc({@required this.appAPI}); // Maybe use application

  @override
  Stream<SearchState> transform(events, next) {
    return super.transform(
      (events as Observable<SearchEvent>).debounce(Duration(milliseconds: 800)),
      next,
    );
  }

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    print(transition);
  }

  @override
  SearchState get initialState => SearchStateEmpty();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await appAPI.searchMusic(searchTerm);
          yield SearchStateSuccess(results.items);
        } catch (error) {
          yield error is SearchResultError
            ? SearchStateError(error.error)
            : SearchStateError('Something went wrong');
        }
      }
    }
  }
}
