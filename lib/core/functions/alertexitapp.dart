

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


// هذه الميثود مهمتها اظهار dialog عندما نقوم بعمل exit من التطبيق و تضاف في كل من صفحتي login و sign up 
//استخدام willpopscope
  Future<bool> alertExitApp(){

Get.defaultDialog(
  title: "تنبيه" ,
  middleText: "هل تريد الخروج من التطبيق ؟" ,
  actions: [
  ElevatedButton(
    
    onPressed: (){
    //من اجل الخروج من التطبيق
    exit(0) ;
  }, child: Text("confirm")),
   ElevatedButton(onPressed: (){
    // من اجل الغاء default dialog
    Get.back();
   }, child: Text("cancel")),

  ]
); 
return Future.value(true);

}