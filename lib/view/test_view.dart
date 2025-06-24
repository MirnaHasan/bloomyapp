
import 'package:bloomy/controller/test_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Test view"),
      ),
      body: 
    GetBuilder<TestController>(builder: (controller){
      return HandlingDataRequest(
      statusRequest: controller.statusRequest! ,
      widget: ListView.builder( itemCount: controller.data.length, 
    itemBuilder:(context , i ){
      return Text("${controller.data}");}) );

  }),
    );
  }
  
}