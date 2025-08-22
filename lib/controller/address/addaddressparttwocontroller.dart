import 'package:bloomy/core/class/statusrequest.dart';
import 'package:get/get.dart';


class AddAddressPartTwoController extends GetxController {

  StatusRequest statusRequest = StatusRequest.loading ;
String? lat ; 
String? long ;


initialData () {
  lat = Get.arguments['lat']; 
  long = Get.arguments['long'];
  print("Latitude: $lat");
  print("Longitude: $long");

}

  @override
  void onInit() {
    initialData() ;
  
    super.onInit();

  }

}