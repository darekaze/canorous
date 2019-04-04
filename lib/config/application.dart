import 'package:canorous/app/model/AppDatabaseMigrationListener.dart';
import 'package:canorous/config/env.dart';
import 'package:canorous/config/routes.dart';
import 'package:canorous/utils/db/DatabaseHelper.dart';
import 'package:canorous/utils/log/Log.dart';
import 'package:logging/logging.dart';
import 'package:fluro/fluro.dart';


class Application {
  Router router;
  DatabaseHelper _db;
  // DBAppStoreRepository dbAppStoreRepository;
  // AppStoreAPIRepository appStoreAPIRepository;

  Future<void> onCreate() async {
    _initLog();
    _initRouter();
    await _initDB();
    // _initDBRepository();
    // _initAPIRepository();
  }

  Future<void> onTerminate() async {
    await _db.close();
  }

  Future<void> _initDB() async {
    AppDatabaseMigrationListener migrationListener = AppDatabaseMigrationListener();
    DatabaseConfig databaseConfig = DatabaseConfig(Env.value.dbVersion, Env.value.dbName, migrationListener);
    _db = DatabaseHelper(databaseConfig);
    Log.info('DB name : ' + Env.value.dbName);
    // await _db.deleteDB();
    await _db.open();
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
