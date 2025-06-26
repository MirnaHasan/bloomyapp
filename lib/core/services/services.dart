

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class MyServices extends GetxService{

late SharedPreferences sharedPreferences ;

Future<MyServices> init ()async{
  await Firebase.initializeApp(
    options: FirebaseOptions(
            apiKey: "AIzaSyBrRzbEmRvpjAse97N10XW-gsyCv3esEFw" ,
            appId: '1:120914193242:android:8eb6791c8ee5d5b58ba163',
      messagingSenderId: '120914193242',
      projectId: 'mybloomy-2f42b',
      storageBucket: 'mybloomy-2f42b.appspot.com', ) 
  );
  sharedPreferences = await SharedPreferences.getInstance();
  
  return this ;
}
}

initialService()async{
 await  Get.putAsync(()=> MyServices().init());
}