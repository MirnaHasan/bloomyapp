

import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController{

goToVerifySignUp() ;
  checkEmail();
}
class CheckEmailControllerImp extends CheckEmailController{
  late TextEditingController email ; 
  
  GlobalKey <FormState> formState = GlobalKey<FormState>();
    @override
  checkEmail() {
 var formData = formState.currentState ;
 if (formData!.validate()){
  print("valllid");
 }else{
  print("not valid");
 }
  }
  @override
  goToVerifySignUp(){
      // Get.offNamed(AppRoutes.verifycodesignup);
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