import 'package:canorous/app/AppComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:canorous/config/application.dart';

enum EnvType {
  DEVELOPMENT,
  PRODUCTION,
  TESTING,
}

class Env {
  static Env value;

  String appName;
  EnvType envType = EnvType.DEVELOPMENT;
  String baseUrl;
  String dbName;

  Env() {
    value = this;
    _init();
  }

  void _init() async {
    if (envType != EnvType.PRODUCTION) {
      Stetho.initialize();
    }
    // Load application config
    var app = Application();
    await app.onCreate();

    runApp(AppComponent(app));
  }
}
