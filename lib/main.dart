import 'package:flutter/material.dart';
import 'package:canorous/utils/themes.dart';
import 'package:canorous/canorous.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canorous',
      theme: darkTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Canorous(),
    );
  }
}
