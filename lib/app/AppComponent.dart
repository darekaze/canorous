import 'package:canorous/app/providers/AppProvider.dart';
import 'package:canorous/config/application.dart';
import 'package:canorous/config/env.dart';
import 'package:canorous/utils/log/Log.dart';
import 'package:canorous/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppComponent extends StatefulWidget {
  const AppComponent(
    this._application, {
    Key key,
  }) : super(key: key);
  final Application _application;

  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
        title: Env.value.appName,
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        onGenerateRoute: widget._application.router.generator,
        localizationsDelegates: [
          // S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        // supportedLocales: S.delegate.supportedLocales,
    );
    print('initial core.route = ${app.initialRoute}');

    return AppProvider(
      child: app,
      application: widget._application,
    );
  }

  @override
  void dispose() async {
    Log.info('dispose');
    await widget._application.onTerminate();
    super.dispose();
  }
}
