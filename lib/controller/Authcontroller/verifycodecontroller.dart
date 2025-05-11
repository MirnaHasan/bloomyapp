

import 'package:bloomy/core/constant/approutes.dart';

import 'package:get/get.dart';


abstract class VerifyCodeController extends GetxController{
goToResetPassword();
  checkCode();

}

class  VerifyCodeControllerImp extends  VerifyCodeController{
 late String verifyCode ;
    @override
  checkCode() {
   
  
  }
    @override
  goToResetPassword() {
Get.offNamed(AppRoutes.resetpassword);
  }

@override
  void onInit() {
 
    super.onInit();
  }
  // @override
  // void dispose() {

  //   super.dispose();
  // }
  

  

}