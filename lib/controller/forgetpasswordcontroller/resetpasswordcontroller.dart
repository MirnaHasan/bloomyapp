import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;
  
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest ;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email ;
  @override
  resetPassword() {
  
  }

  @override
  goToSuccessResetPassword() async{
    var formData = formState.currentState ;
    if(password.text != repassword.text){
      Get.defaultDialog(
        title: "Warning" ,
        middleText: "Passwords dont match"
      );
    }
 if (formData!.validate()){
  statusRequest = StatusRequest.loading ;
  update();
  var response = await resetPasswordData.postData(email!, password.text) ; 
  statusRequest = handlingData(response);
  if (StatusRequest.success == statusRequest){
    if(response['status']== 'success'){
      Get.offNamed(AppRoutes.successrestpassword);
    }else{
      Get.defaultDialog(
        title: "Warning",
        middleText: "" 
      );
      statusRequest = StatusRequest.failure;
    }
  }
   update(); 

 }
   }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
