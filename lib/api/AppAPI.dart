// import 'package:canorous/api/provider/CanorousProvider.dart';
import 'package:canorous/api/provider/InvidiousProvider.dart';
import 'package:canorous/data/AppDatabase.dart';
import 'package:sembast/sembast.dart';

class AppAPI {
  AppAPI() {
    // _cProvider = CanorousProvider();
    _iProvider = InvidiousProvider();
  }

  // CanorousProvider _cProvider;
  InvidiousProvider _iProvider;

  Future<Database> get _db async => await AppDatabase.instance.database;

  // TODO: implement access function (use rxdart here)
}
