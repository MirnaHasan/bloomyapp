


import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController{
signIn();
goTosignUp();
goToForgetPaaword ();

}

class SignInControllerImp extends SignInController{

  late TextEditingController email ; 
  late TextEditingController password ;
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  bool isshowPass = true ;
  showPassword(){
    isshowPass =  isshowPass == true ? false : true ;
    update();
  }
  @override
  signIn() {
    var formData = formState.currentState ;
    if(formData!.validate()){
      print("valid");
    }else{
      print("not valid");
    }

  
  }
  @override
  goToForgetPaaword() {
 Get.offNamed(AppRoutes.forgetpassword);
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
  
  @override
  goTosignUp() {
  Get.offNamed(AppRoutes.signUpScreen);
  }
  
  
}