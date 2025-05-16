import 'package:bloomy/core/constant/approutes.dart';
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
  @override
  resetPassword() {
    var formData = formState.currentState ;
 if (formData!.validate()){
  print("valllid");
 }else{
  print("not valid");
 }
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoutes.successrestpassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
