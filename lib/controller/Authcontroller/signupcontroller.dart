import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
goToSignIn();
signUp();

}

class SignUpControllerImp extends SignUpController{
  bool obscureshowpassword = true ; 
  showObScure(){
    obscureshowpassword =obscureshowpassword == true ? false : true ;
    update(); 
  }
  
  GlobalKey <FormState> formState = GlobalKey<FormState>();
    @override
  signUp() {
    var formData  = formState.currentState ;
    if (formData!.validate()){
      
    Get.offNamed(AppRoutes.verifycodesignup);
   
      print("valid");
    }else{
      print("not valid");
    }
   
  }
  

  late TextEditingController email ; 
  late TextEditingController password ;
  
  late TextEditingController username ; 
  
  late TextEditingController phone; 
 
  @override
  goToSignIn() {
      Get.offNamed(AppRoutes.signInScreen);
  
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