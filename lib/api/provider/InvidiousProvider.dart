import 'dart:convert';

import 'package:canorous/api/model/SearchResult.dart';
import 'package:canorous/api/provider/APIProvider.dart';
import 'package:dio/dio.dart';

class InvidiousProvider extends APIProvider {
  static const TAG = 'InvidiousProvider';
  static const _link = 'https://invidio.us/api/v1';

  InvidiousProvider() : super(TAG, _link);

  // Invidious api calls below..

  Future<SearchResult> search(String term) async {
    const _SEARCH_API = '/search';
    final Response response = await dio.get(
      _SEARCH_API,
      queryParameters: {
        'q': term,
        'type':'video',
        'duration':'short',
        'sort_by':'relevance',
      },
    );
    return (response.statusCode == 200)
      ? SearchResult.fromJson(response.data)
      : SearchResultError.fromJson(response.data);
  }
}
