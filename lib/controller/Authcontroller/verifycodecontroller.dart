

import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';


abstract class VerifyCodeController extends GetxController{
goToResetPassword();
  checkCode();

}

class  VerifyCodeControllerImp extends  VerifyCodeController{
 late String verifyCode ;
 
  GlobalKey <FormState> formState = GlobalKey<FormState>();
    @override
  checkCode() {
     var formData = formState.currentState ;
 if (formData!.validate()){
  print("valllid");
 }else{
  print("not valid");
 }
   
  
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