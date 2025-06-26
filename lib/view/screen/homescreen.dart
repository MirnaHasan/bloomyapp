

import 'package:bloomy/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeComtrollerImp controller = Get.put(HomeComtrollerImp());
    return Scaffold(body:  Center(
      child: Column(
        children: [
          Center(child: Text("${controller.username}"),),
        ],
      ),
    ),);
   
  }
}