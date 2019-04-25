import 'package:flutter/material.dart';

enum CurrentTheme { dark, light }

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  backgroundColor: Colors.white,
  buttonColor: Colors.black,
  unselectedWidgetColor: Colors.white,
);
