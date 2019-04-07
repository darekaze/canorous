import 'package:canorous/app/AppProvider.dart';
import 'package:canorous/config/application.dart';
import 'package:canorous/config/env.dart';
import 'package:canorous/utils/log/Log.dart';
import 'package:canorous/utils/themes.dart';
import 'package:flutter/material.dart';

class AppComponent extends StatefulWidget {
  AppComponent(this._application);
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
        darkTheme: darkTheme,
        onGenerateRoute: widget._application.router.generator,
        // localizationsDelegates: [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
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
