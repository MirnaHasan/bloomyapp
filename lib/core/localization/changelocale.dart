


import 'package:bloomy/core/constant/apptheme.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class ChangLocalController extends GetxController{
Locale? language ;
ThemeData appTheme = themeEnglish ; 
MyServices myService =Get.find() ;
void changeLanguage(String langCode){
Locale locale = Locale(langCode) ;
myService.sharedPreferences.setString("lang", langCode);
appTheme = langCode=="ar" ? themeArabic : themeEnglish ;
Get.updateLocale(locale);

}

@override
  void onInit() {
 String? initLang =  myService.sharedPreferences.getString("lang") ;
 if (initLang == "ar"){
  language = Locale("ar");
  appTheme = themeArabic ;
 }else if (initLang=="en"){
    language = Locale("en");
    appTheme =themeEnglish ;
 }else{
      language = Locale(Get.deviceLocale!.languageCode);
        appTheme =themeEnglish ;
 }
    super.onInit();
  }





}