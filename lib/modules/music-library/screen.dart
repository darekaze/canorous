import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:canorous/services/counter.dart';

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);

  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Counter c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("Bruh for ${c.count}")));
  }
}
