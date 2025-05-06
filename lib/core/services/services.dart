

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class MyServices extends GetxService{

late SharedPreferences sharedPreferences ;

Future<MyServices> init ()async{
  sharedPreferences = await SharedPreferences.getInstance();
  return this ;
}
}

initialService()async{
 await  Get.putAsync(()=> MyServices().init());
}