import 'package:canorous/api/model/Post.dart';
import 'package:canorous/api/provider/APIProvider.dart';
import 'package:canorous/config/env.dart';
import 'package:dio/dio.dart';

class CanorousProvider extends APIProvider {
  static const TAG = 'CanorousProvider';

  CanorousProvider() : super(TAG, Env.value.baseUrl);

  // Canorous api calls here

  Future fetchPosts(int startIndex, int limit) async {
    const _FETCH_POSTS_API = '/posts';
    try {
      final Response response = await dio.get(
        _FETCH_POSTS_API,
        queryParameters: {
          '_start': startIndex,
          '_limit': limit,
        },
      );
      return (response.data as List)
          .map(
              (dynamic item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioError catch (e) {
      print(e.error);
    }
  }

  Future submitPost(Post post) async {
    const _SUBMIT_POST_API = '/posts';

    final data = post.toJson();
    data.removeWhere((key, value) => value == null);
    try {
      final Response response = await dio.post(
        _SUBMIT_POST_API,
        data: data,
      );
      return Post.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
