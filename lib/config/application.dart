import 'package:canorous/config/env.dart';
import 'package:canorous/config/routes.dart';
import 'package:canorous/db/AppDatabase.dart';
import 'package:canorous/utils/log/Log.dart';
import 'package:logging/logging.dart';
import 'package:fluro/fluro.dart';
import 'package:sembast/sembast.dart';

class Application {
  Router router;
  Database _db;
  // DBAppStoreRepository dbAppStoreRepository;
  // AppStoreAPIRepository appStoreAPIRepository;

  Future<void> onCreate() async {
    _initLog();
    _initRouter();
    await _initDB();
    // _initDBRepository();
    // _initAPIRepository();
  }

  Future<void> onTerminate() async {}

  Future<void> _initDB() async {
    _db = await AppDatabase.instance.database;
    Log.info('DB name : ' + Env.value.dbName);

    // Reset the database (call once only)
    // await AppDatabase.instance.deleteDB();
  }

  // void _initDBRepository(){
  //   dbAppStoreRepository = DBAppStoreRepository(_db.database);
  // }

  // void _initAPIRepository(){
  //   APIProvider apiProvider = APIProvider();
  //   appStoreAPIRepository = AppStoreAPIRepository(apiProvider, dbAppStoreRepository);
  // }

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

  void _initRouter(){
    router = Router();
    Routes.configureRoutes(router);
  }
}
