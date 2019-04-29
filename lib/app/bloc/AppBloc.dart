import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/app/bloc/post/bloc.dart';
import 'package:canorous/app/bloc/post_submit/bloc.dart';
import 'package:canorous/app/bloc/search/bloc.dart';

class AppBloc {
  final AppAPI appAPI;
  SearchBloc _searchBloc;
  PostBloc _postBloc;
  PostSubmitBloc _postSubmitBloc;


  AppBloc(this.appAPI) {
    _searchBloc = SearchBloc(appAPI: appAPI);
    _postBloc = PostBloc(appAPI: appAPI);
    _postSubmitBloc = PostSubmitBloc(appAPI: appAPI);
  }

  SearchBloc get searchBloc => _searchBloc;
  PostBloc get postBloc => _postBloc;
  PostSubmitBloc get postSubmitBloc => _postSubmitBloc;
}