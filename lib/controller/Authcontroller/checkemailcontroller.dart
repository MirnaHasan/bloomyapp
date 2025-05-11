

import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController{

goToSuccessSignUp();
  checkEmail();
}
class CheckEmailControllerImp extends CheckEmailController{
  late TextEditingController email ; 
    @override
  checkEmail() {
 
  }
  @override
  goToSuccessSignUp(){
      Get.offNamed(AppRoutes.successSignup);
  }
@override
  void onInit() {
   email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
  email.dispose() ;
    super.dispose();
  }
}