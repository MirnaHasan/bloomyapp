

import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myservices = Get.find() ; 

  logout(){
    myservices.sharedPreferences.clear() ; 
    Get.offAllNamed(AppRoutes.signInScreen) ;

  }
} 