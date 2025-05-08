


import 'package:bloomy/controller/Authcontroller/signincontroller.dart';
import 'package:bloomy/controller/Authcontroller/signupcontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:bloomy/view/widget/auth/logoauth.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
   SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
        child: ListView(
        
        children: [
          SizedBox(height: 40,) , 
          Text(textAlign: TextAlign.center ,
    
          "Sign Up " , 
       
        style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 20,) , 
          CustomTextBody(text: "Sign up with your email and password") ,
          SizedBox(height: 40,),
            CustomMaterialButtonAuth(labelText: "Email", hintText:  "Enter your email",
           icon:  Icon(Icons.email_outlined), myController: controller.email,), 
          SizedBox(height: 40,) , 
          CustomMaterialButtonAuth(labelText: "username", hintText:  "Enter your username",
           icon:  Icon(Icons.person_2_outlined), myController: controller.username,),
          SizedBox(height: 40,),

        CustomMaterialButtonAuth(labelText: "Password", hintText:  "Enter your password",
           icon:  Icon(Icons.lock_clock_outlined), myController: controller.password),
          SizedBox(height: 40,),
             CustomMaterialButtonAuth(labelText: "phone", hintText:  "Enter your phone",
           icon:  Icon(Icons.phone_android_outlined), myController: controller.phone,),
            SizedBox(height: 80,),
          CustomTextSigninOrSignUp(textbutton: "Sign Up", onPressed: (){
           
          }) ,
          SizedBox(height: 40,),
           CustomTextSigninOrSignUp(textbutton: "Sign In", onPressed: (){
            controller.goToSignIn();
           
          }) ,
           
       
        
            
         
        ],
      )),
    );
  }
}