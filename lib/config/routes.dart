import 'package:canorous/app/views/PostPage.dart';
import 'package:canorous/app/views/root.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Root();
  });

var postPageRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String videoId = params['videoId']?.first;
    String videoTitle = params['videoTitle']?.first;

    return PostPage(videoId: videoId, videoTitle: videoTitle);
  });

class Routes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        print('ERROR: Route not found!!');
      });
    router.define(Root.PATH, handler: rootHandler);
    router.define(PostPage.PATH, handler: postPageRouteHandler);
  }
}
