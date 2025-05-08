import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
goToSignIn();
  signUp();

}

class SignUpControllerImp extends SignUpController{
    @override
  signUp() {
   
    throw UnimplementedError();
  }
  

  late TextEditingController email ; 
  late TextEditingController password ;
  
  late TextEditingController username ; 
  
  late TextEditingController phone; 
  @override
  goToSignIn() {
      Get.toNamed(AppRoutes.signInScreen);
  
  }

  


@override
  void onInit() {
   email = TextEditingController();
   password= TextEditingController();
     username= TextEditingController();
       phone= TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
  email.dispose() ;
  password.dispose();
  username.dispose();
  phone.dispose();
    super.dispose();
  }
  

}