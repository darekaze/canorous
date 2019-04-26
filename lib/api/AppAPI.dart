import 'package:canorous/api/cache/InvidiousCache.dart';
import 'package:canorous/api/model/Post.dart';
import 'package:canorous/api/model/SearchResult.dart';
import 'package:canorous/api/provider/CanorousProvider.dart';
import 'package:canorous/api/provider/InvidiousProvider.dart';
import 'package:canorous/data/AppDatabase.dart';
import 'package:sembast/sembast.dart';

class AppAPI {
  AppAPI() {
    _cProvider = CanorousProvider();
    _iProvider = InvidiousProvider();
    _iCache = InvidiousCache();
  }

  CanorousProvider _cProvider;
  InvidiousProvider _iProvider;
  InvidiousCache _iCache;

  Future<Database> get _db async => await AppDatabase.instance.database;

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
    return await _cProvider.fetchPosts(startIndex, limit);
  }
}
