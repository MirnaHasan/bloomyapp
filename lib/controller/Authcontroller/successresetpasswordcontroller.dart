

import 'package:bloomy/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToSignInPage();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToSignInPage() {
  Get.offAllNamed(AppRoutes.signInScreen);
  }

}