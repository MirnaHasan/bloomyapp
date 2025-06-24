

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToSignInPage();
  StatusRequest statusRequest = StatusRequest.none;
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToSignInPage() {
  Get.offAllNamed(AppRoutes.signInScreen);
  }

}