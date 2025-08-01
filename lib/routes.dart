

import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/middleware/mymiddleware.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/forgetpassword.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/resetpassword.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/successresetpassword.dart';
import 'package:bloomy/view/screen/Auth/forgetpassword/verifycode.dart';



import 'package:bloomy/view/screen/Auth/signinscreen.dart';


import 'package:bloomy/view/screen/Auth/signupscreen.dart';
import 'package:bloomy/view/screen/Auth/success_signup.dart';

import 'package:bloomy/view/screen/Auth/verifycodesignup.dart';
import 'package:bloomy/view/screen/cart.dart';
import 'package:bloomy/view/screen/home.dart';
import 'package:bloomy/view/screen/homescreen.dart';
import 'package:bloomy/view/screen/items.dart';
import 'package:bloomy/view/screen/language.dart';
import 'package:bloomy/view/screen/myfavorite.dart';

import 'package:bloomy/view/screen/onboardingscreen.dart';
import 'package:bloomy/view/screen/productdetails.dart';


import 'package:get/get_navigation/src/routes/get_route.dart';



List<GetPage<dynamic>>? routes = [
  //  GetPage(name: "/" , page: ()=>LanguageApp(), middlewares: [MyMiddleWare()]) ,
     GetPage(name: "/" , page: ()=>Cart()) ,
  //  GetPage(name: "/" , page: ()=>TestView()) ,
  // GetPage(name: "/" , page: ()=>ProductDetails()) ,
  GetPage(name: AppRoutes.onBoarding  , page: ()=>OnBoardingScreen(),) ,
  ///Auth +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  GetPage(name: AppRoutes.signInScreen   , page: ()=>SignInScreen() ,) ,
  GetPage(name:   AppRoutes.signUpScreen   , page: ()=> SignUpScreen() ) ,

  GetPage(name: AppRoutes.forgetpassword   , page: ()=> ForgetPassword() ,) ,
  GetPage(name: AppRoutes.resetpassword , page: ()=>ResetPassword() ,) ,
  GetPage(name:  AppRoutes.verifycode  , page: ()=> Verifycode(),) ,
  GetPage(name: AppRoutes.successSignup  , page: ()=>SuceessSignUp() ,) ,
  GetPage(name:   AppRoutes.successrestpassword   , page: ()=> SuccessResetPassword(),) ,
  GetPage(name: AppRoutes.verifycodesignup   , page: ()=>VerifyCodeSignUp(),) ,
  ///++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ///Home+=====================================
    GetPage(name:   AppRoutes.homepage  , page: ()=> HomeScreen() ,) ,
    GetPage(name:   AppRoutes.items  , page: ()=> Items() ,) ,
    GetPage(name:   AppRoutes.productdetails  , page: ()=> ProductDetails() ,) ,
    //==================================myfavorite=======================================================================

   GetPage(name:   AppRoutes.myfavorite  , page: ()=> MyFavorite() ,) ,
   //===================================cart====================
   GetPage(name:   AppRoutes.cart  , page: ()=> Cart() ,) ,

];



  