

import 'package:bloomy/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController{
  goToSignInPage();
}
class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToSignInPage() {
  Get.offAllNamed(AppRoutes.signInScreen);
  }

}