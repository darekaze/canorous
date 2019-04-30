import 'package:canorous/api/cache/InvidiousCache.dart';
import 'package:canorous/api/model/Post.dart';
import 'package:canorous/api/model/SearchResult.dart';
import 'package:canorous/api/provider/CanorousProvider.dart';
import 'package:canorous/api/provider/InvidiousProvider.dart';

class AppAPI {
  AppAPI() {
    _cProvider = CanorousProvider();
    _iProvider = InvidiousProvider();
    _iCache = InvidiousCache();
  }

  CanorousProvider _cProvider;
  InvidiousProvider _iProvider;
  InvidiousCache _iCache;

  // Implement access function (better use observable)

  Future<SearchResult> searchMusic(String term) async {
    if (_iCache.contains(term)) {
      return _iCache.get(term);
    } else {
      final result = await _iProvider.search(term);
      if (result is SearchResult) {
        _iCache.set(term, result);
      }
      return result;
    }
  }

  Future<List<Post>> fetchPosts(int startIndex, int limit) async {
    final List<Post> result = await _cProvider.fetchPosts(startIndex, limit);
    return result;
  }

  Future<Post> submitPost(Post post) async {
    final Post result = await _cProvider.submitPost(post);
    return result;
  }
}
