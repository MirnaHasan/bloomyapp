import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ResetPassword extends GetxController {
  goToSuccessResetPassword();
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPassword {
  late TextEditingController password;
  late TextEditingController repassword;
  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() {
    Get.toNamed(AppRoutes.successrestpassword);
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
