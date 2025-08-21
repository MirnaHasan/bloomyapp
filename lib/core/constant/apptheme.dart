


//هذا الملف من اجل تغيير ثيم الخط عند اختيار اللغة الانكليزية او العربية 
// يجب ان يضاف الى sharedpref  لا تنسي ميرناااااا :) 

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';


ThemeData themeEnglish = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.green , 

  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.green , 
  ),
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
      );
      /// هذا الثيم خاص باللغة العربية 
      /// 
      ThemeData themeArabic = ThemeData(
        fontFamily: "Cairo",
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
      );