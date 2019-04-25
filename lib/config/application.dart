import 'package:canorous/app/components/player.dart';
import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/config/env.dart';
import 'package:canorous/config/routes.dart';
import 'package:canorous/data/AppDatabase.dart';
import 'package:canorous/utils/log/Log.dart';
import 'package:logging/logging.dart';
import 'package:fluro/fluro.dart';

class Application {
  Router router;
  AppAPI appAPI;
  PlayerWidget player;
  // TODO: init music player here (should be global)

  Future<void> onCreate() async {
    _initLog();
    _initRouter();
    await _initDB();
    _initAppAPI();
    _initPlayer();
  }

  void _initRouter(){
    router = Router();
    Routes.configureRoutes(router);
  }

  Future<void> _initDB() async {
    // Making sure db is created at beginning
    await AppDatabase.instance.database;
    Log.info('DB name : ' + Env.value.dbName);

    // Reset the database (call once only)
    // await AppDatabase.instance.deleteDB();
  }

  void _initAppAPI() {
    appAPI = AppAPI();
  }

  void _initPlayer() {
    player = PlayerWidget(); // TODO: change to init real player
  }

  void _initLog(){
    Log.init();

    switch(Env.value.envType){
      case EnvType.TESTING:
      case EnvType.DEVELOPMENT:{
        Log.setLevel(Level.ALL);
        break;
      }
      case EnvType.PRODUCTION:{
        Log.setLevel(Level.INFO);
        break;
      }
    }
  }

  Future<void> onTerminate() async {}
}
