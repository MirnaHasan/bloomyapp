


import 'package:bloomy/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class ChangLocalController extends GetxController{
Locale? language ; 
MyServices myService =Get.find() ;
void changeLanguage(String langCode){
Locale locale = Locale(langCode) ;
myService.sharedPreferences.setString("lang", langCode);
Get.updateLocale(locale);

}

@override
  void onInit() {
 String? initLang =  myService.sharedPreferences.getString("lang") ;
 if (initLang == "ar"){
  language = Locale("ar");
 }else if (initLang=="en"){
    language = Locale("en");
 }else{
      language = Locale(Get.deviceLocale!.languageCode);
 }
    super.onInit();
  }





}