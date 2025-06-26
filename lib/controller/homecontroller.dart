
import 'package:bloomy/core/services/services.dart';
import 'package:get/get.dart';

 class HomeController extends GetxController {


}


class HomeComtrollerImp extends HomeController {
  String? username;
  MyServices myServices = Get.find();
  initialData() {
    username = myServices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
