

import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/view/screen/Auth/signinscreen.dart';

import 'package:bloomy/view/screen/Auth/signinsignup.dart';
import 'package:bloomy/view/screen/Auth/signupscreen.dart';
import 'package:bloomy/view/screen/homescreen.dart';
import 'package:bloomy/view/screen/language.dart';
import 'package:bloomy/view/screen/onboardingscreen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes ={
  AppRoutes.language     : (context)=> LanguageApp(),
  AppRoutes.onBoarding   : (context)=>OnBoardingScreen(),
  AppRoutes.signInsignUp : (context)=>signInsignUp() , 
  AppRoutes.signInScreen : (context)=> SignInScreen() ,
  AppRoutes.signUpScreen :(context)=> SignUpScreen() ,
  AppRoutes.homeScreen : (context)=> HomeScreen() ,
};