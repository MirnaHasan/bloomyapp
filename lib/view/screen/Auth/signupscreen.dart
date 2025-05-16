



import 'package:bloomy/controller/Authcontroller/signupcontroller.dart';
import 'package:bloomy/core/functions/inputvalid.dart';

import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';

import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
   SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
        child: 
        Form(
          key: controller.formState,
          child: ListView(
          
          children: [
            SizedBox(height: 40,) , 
            Text(textAlign: TextAlign.center ,
              
            "Sign Up " , 
                 
          style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: 20,) , 
            CustomTextBody(text: "Sign up with your email and password") ,
            SizedBox(height: 40,),
              CustomMaterialButtonAuth(
                
                labelText: "Email", hintText:  "Enter your email",
             icon:  Icon(Icons.email_outlined), myController: controller.email,
              valid: (val ) {
                return validInput(val!, 8, 30, "email");
                },
              ), 
            SizedBox(height: 40,) , 
            CustomMaterialButtonAuth(
               valid: (val ) {
                return validInput(val!, 5, 20, "username");
                },
              
              labelText: "username", hintText:  "Enter your username",
             icon:  Icon(Icons.person_2_outlined), myController: controller.username,),
            SizedBox(height: 40,),
          
          CustomMaterialButtonAuth(
             valid: (val ) {
                return validInput(val!, 6, 30, "password");
                },
            
            labelText: "Password", hintText:  "Enter your password",
             icon:  Icon(Icons.lock_clock_outlined), myController: controller.password),
            SizedBox(height: 40,),
               CustomMaterialButtonAuth(
                 valid: (val ) {
                return validInput(val!, 10, 30, "phone");
                },
                
                labelText: "phone", hintText:  "Enter your phone",
             icon:  Icon(Icons.phone_android_outlined), myController: controller.phone,),
              SizedBox(height: 80,),
            CustomTextSigninOrSignUp(textbutton: "Sign Up", onPressed: (){
             controller.signUp();
            }) ,
            SizedBox(height: 40,),
             CustomTextSigninOrSignUp(textbutton: "Sign In", onPressed: (){
              controller.goToSignIn();
             
            }) ,
             
                 
          
              
           
          ],
                ),
        )),
    );
  }
}