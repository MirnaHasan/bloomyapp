

import 'package:bloomy/core/constant/approutes.dart';

import 'package:bloomy/view/screen/Auth/signinsignup.dart';
import 'package:bloomy/view/screen/language.dart';
import 'package:bloomy/view/screen/onboardingscreen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes ={
  AppRoutes.language:(context)=> LanguageApp(),
  AppRoutes.onBoarding :(context)=>OnBoardingScreen(),
  AppRoutes.signInsignUp : (context)=>signInsignUp()
};