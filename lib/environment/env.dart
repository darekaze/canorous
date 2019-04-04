import 'package:canorous/app/canorous.dart';
import 'package:canorous/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';

enum EnvType {
  DEVELOPMENT,
  PRODUCTION,
  TESTING
}

class Env {
  static Env value;

  String appName;
  String baseUrl;
  EnvType envType = EnvType.DEVELOPMENT;

  int dbVersion = 1;
  String dbName;

  Env() {
    value = this;
    _init();
      }

  void _init() async {
    if (envType != EnvType.PRODUCTION) {
      Stetho.initialize();
    }

    // TODO: Reorder this part
    runApp(
      MaterialApp(
        title: 'Canorous',
        theme: darkTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: Canorous(),
      )
    );
  }
}
