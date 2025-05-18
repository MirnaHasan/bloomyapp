



import 'package:bloomy/controller/Authcontroller/signupcontroller.dart';
import 'package:bloomy/core/functions/alertexitapp.dart';
import 'package:bloomy/core/functions/validinput.dart';

import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';

import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>SignUpControllerImp());
    return Scaffold(

      body: 
      WillPopScope(
         onWillPop: alertExitApp ,
        child:  GetBuilder<SignUpControllerImp>(builder: (controller)=>Container(
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
             valid: (val) { return validInput(val!, 8, 20, "email"); }, isNumber: false,), 
            SizedBox(height: 40,) , 
            CustomMaterialButtonAuth(
              isNumber: false,
              valid: (val) { return validInput(val!, 2, 20, "username"); },
              labelText: "username", hintText:  "Enter your username",
             icon:  Icon(Icons.person_2_outlined), myController: controller.username,),
            SizedBox(height: 40,),
          GetBuilder<SignUpControllerImp>(builder: (controller)=> CustomMaterialButtonAuth(
            onTapIcon: () {
              controller.showObScure();
            },
            obscureText: controller.obscureshowpassword ,
            valid: (val) { return validInput(val!, 6, 20, "password"); },
            labelText: "Password", 
            hintText:  "Enter your password",
            icon:  Icon(Icons.lock_clock_outlined),
            myController: controller.password, isNumber: false,),),
         
            SizedBox(height: 40,),
               CustomMaterialButtonAuth(
                isNumber: true,
                valid: (val) { return validInput(val!, 6, 20, "phone"); },
                
                labelText: "phone", hintText:  "Enter your phone",
             icon:  Icon(Icons.phone_android_outlined), myController: controller.phone,),
              SizedBox(height: 80,),
            CustomTextSigninOrSignUp(textbutton: "Sign Up", onPressed: (){
             controller.signUp();
            }) ,
            SizedBox(height: 40,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("if you have an account? ",
                 style: Theme.of(context).textTheme.titleSmall) ,
                InkWell(onTap: () {
                 controller.goToSignIn();
                },
                child: Text("   Sing In" ,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red))), 
              ],)
             
                 
          
              
           
          ],
                ),
        )),),)
     
    );
  }
}