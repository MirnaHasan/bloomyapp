

import 'package:bloomy/core/constant/approutes.dart';

import 'package:get/get.dart';


abstract class VerifyCodeController extends GetxController{
goToResetPassword();
  signUp();

}

class  VerifyCodeControllerImp extends  VerifyCodeController{
    @override
  signUp() {
   
  
  }
  


  @override
 

  


@override
  void onInit() {
 
    super.onInit();
  }
  @override
  void dispose() {

    super.dispose();
  }
  
  @override
  goToResetPassword() {
Get.offNamed(AppRoutes.resetpassword);
  }
  

}