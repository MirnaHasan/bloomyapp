
import 'package:bloomy/core/localization/changelocale.dart';
import 'package:bloomy/core/localization/mytranslation.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/routes.dart';

import 'package:bloomy/view/screen/language.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';




void main() async{
  
   WidgetsFlutterBinding.ensureInitialized();
 await initialService();
  
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    ChangLocalController controller = Get.put(ChangLocalController ());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      locale:controller.language,
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.bold,
            color: Colors.black
          ), 
          titleLarge: TextStyle(
            fontSize: 26, 
            fontWeight: FontWeight.bold,
         color: Colors.black
          ), 
           titleSmall: TextStyle(
            fontSize: 15, 
            fontWeight: FontWeight.bold,
         color: const Color.fromARGB(255, 124, 122, 122)
          ), 
          bodyMedium: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 125, 123, 123)
          ), 
          bodySmall:  TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 255, 255)
          ), 
        ),
      ),
      home: 
      // TestPackages(),
      LanguageApp(),
    );
  }
}
