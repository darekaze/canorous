import 'package:canorous/app/views/root.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Root();
  });

// var appDetailRouteHandler = Handler(
//   handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//     String appId = params['appId']?.first;
//     String heroTag = params['heroTag']?.first;
//     String title = params['title']?.first;
//     String url = params['url']?.first;
//     String titleTag = params['titleTag']?.first;

//     return AppDetailPage(appId: num.parse(appId), heroTag:heroTag,title: title, url: url, titleTag: titleTag);
//   });

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR: Route not found!!');
      });
    router.define(Root.PATH, handler: rootHandler);
    // router.define(AppDetailPage.PATH, handler: appDetailRouteHandler);
  }
}
