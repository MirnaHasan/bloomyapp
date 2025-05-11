

import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/view/screen/Auth/checkemail.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/forgetpassword.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/resetpassword.dart';
import 'package:bloomy/view/screen/Auth/signinscreen.dart';

import 'package:bloomy/view/screen/Auth/signinsignup.dart';
import 'package:bloomy/view/screen/Auth/signupscreen.dart';
import 'package:bloomy/view/screen/Auth/success_signup.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/successresetpassword.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/verifycode.dart';
import 'package:bloomy/view/screen/homescreen.dart';

import 'package:bloomy/view/screen/onboardingscreen.dart';
import 'package:flutter/material.dart';

Map <String , Widget Function (BuildContext)> routes = {

  AppRoutes.onBoarding                : (context)=>OnBoardingScreen(),
  AppRoutes.signInsignUp              : (context)=>signInsignUp() , 
  AppRoutes.signInScreen              : (context)=> SignInScreen() ,
  AppRoutes.signUpScreen              :(context)=> SignUpScreen() ,
  AppRoutes.homeScreen                : (context)=> HomeScreen() ,
  AppRoutes.forgetpassword            : (context)=> ForgetPassword() ,
  AppRoutes.resetpassword             : (context)=> ResetPassword() ,
  AppRoutes.verifycode                : (context)=> Verifycode(),
  AppRoutes.successSignup             : (context)=> SuceessSignUp() ,
  AppRoutes.successrestpassword       : (context)=> SuccessResetPassword(),
  AppRoutes.checkEmail                : (context)=> CheckEmail(),
  

  
};