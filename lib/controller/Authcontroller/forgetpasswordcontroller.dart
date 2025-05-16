
import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController{
 goToVerifyCode();
  checkEmail();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  
  GlobalKey <FormState> formState = GlobalKey<FormState>();
    @override
  checkEmail() {
   
 
  }
  

  late TextEditingController email ; 

  @override
  goToVerifyCode(){
      var formData = formState.currentState ;
 if (formData!.validate()){
   Get.offNamed(AppRoutes.verifycode);
  print("valllid");
 }else{
  print("not valid");
 }
  
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