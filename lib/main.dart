import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/home/screen.dart';

void main() => runApp(GetMaterialApp(
    title: 'Canorous',
    theme: ThemeData(primarySwatch: Colors.green),
    home: const Home()));
