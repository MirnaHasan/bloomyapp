
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware{

MyServices myServices = Get.find();

@override
  
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? route) {
      if (myServices.sharedPreferences.getString("step")== "2"){
      return RouteSettings(name: AppRoutes.homepage);
    }
    if (myServices.sharedPreferences.getString("step")== "1"){
      return RouteSettings(name: AppRoutes.signInScreen);
    }
    
   
   return null ; 
  }


} 