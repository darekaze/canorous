import 'package:flutter/material.dart';

enum currentTheme { dark }

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  buttonColor: Colors.white,
  unselectedWidgetColor: Colors.white,
  primaryTextTheme: TextTheme(
    caption: TextStyle(color: Colors.white),
  ),
);
