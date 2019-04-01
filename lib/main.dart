import 'package:flutter/material.dart';
import 'package:canorous/scaffold_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canorous',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaffoldRoute(),
    );
  }
}
