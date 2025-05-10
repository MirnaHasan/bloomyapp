
import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
goToVerifyCode();
  checkEmail();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
    @override
  checkEmail() {
 
  }
  

  late TextEditingController email ; 

  @override
  goToVerifyCode(){
      Get.offNamed(AppRoutes.verifycode);
  
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