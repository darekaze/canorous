import 'package:canorous/app/components/player.dart';
import 'package:canorous/api/AppAPI.dart';
import 'package:canorous/config/application.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// ENHANCE: use provider library for cleaner code
class AppProvider extends InheritedWidget {

  final Application application;

  AppProvider({Key key, Widget child, this.application})
      : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AppProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider);
  }

  static Router getRouter(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider).application.router;
  }

  static AppAPI getAPI(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider).application.appAPI;
  }

  static Application getApplication(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider).application;
  }

  static PlayerWidget getPlayer(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppProvider) as AppProvider).application.player;
  }
}
