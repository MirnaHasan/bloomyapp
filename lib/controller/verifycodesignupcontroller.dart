


import 'package:bloomy/core/constant/approutes.dart';

import 'package:get/get.dart';


abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp() ;
  checkCode();

}

class  VerifyCodeSignUpControllerImp extends  VerifyCodeSignUpController{
 late String verifyCode ;
    @override
  checkCode() {
   
  
  }
    @override
  goToSuccessSignUp() {
Get.offNamed(AppRoutes.successSignup);
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