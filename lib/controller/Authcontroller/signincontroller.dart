


import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController{
signIn();

}

class SignInControllerImp extends SignInController{

  late TextEditingController email ; 
  late TextEditingController password ;
  @override
  signIn() {
      Get.toNamed(AppRoutes.homeScreen);
  
  }
  


@override
  void onInit() {
   email = TextEditingController();
   password= TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
  email.dispose() ;
  password.dispose();
    super.dispose();
  }
}