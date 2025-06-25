


import 'package:bloomy/controller/Authcontroller/signincontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';

import 'package:bloomy/core/functions/alertexitapp.dart';
import 'package:bloomy/core/functions/validinput.dart';
import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:bloomy/view/widget/auth/logoauth.dart';


import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(SignInControllerImp());
    return Scaffold(

       appBar: AppBar(
        centerTitle: true,
        title: Text(
    
          "Sign In " , 
       
        style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: 
     WillPopScope(
       onWillPop: alertExitApp ,
      child: GetBuilder<SignInControllerImp>(
        builder: (controller)=>
      HandlingDataRequest(
        statusRequest: controller.statusRequest, 
      widget: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
        child: 
        Form(
          key: controller.formState,
          child: ListView(
          
          children: [
            
            CustomTextAuth(title: "BLOOMY WELCOME YOU") ,
          SizedBox(height: 30,) ,
            CustomTextBody(text: "Sign in with your email and password") ,
            SizedBox(height: 40,),
           LogoAuth(),
            SizedBox(height: 30,) , 
            CustomMaterialButtonAuth(
              isNumber: false,
              valid: (val) { return validInput(val!, 8, 20, "email"); },
              labelText: "Email", hintText:  "Enter your email",
             icon:  Icon(Icons.email_outlined), myController: controller.email,),
            SizedBox(height: 20,),
          
       GetBuilder<SignInControllerImp>(builder: (controller)=>   CustomMaterialButtonAuth(
            onTapIcon: (){
              controller.showPassword();
            },
            obscureText: controller.isshowPass,
              isNumber: false,
            valid: (val) { return validInput(val!, 6, 20, "password"); },
            labelText: "Password", hintText:  "Enter your password",

             icon:  Icon(Icons.lock_clock_outlined), myController: controller.password,),),

            SizedBox(height: 30,), 
            InkWell(
            onTap: () {
              controller.goToForgetPaaword();
            },
              child: Text( textAlign: TextAlign.right ,
                "Forgot password ? ", style: Theme.of(context).textTheme.titleSmall),
            ) ,
                 SizedBox(height: 30,),
              CustomTextSigninOrSignUp(textbutton: "Sign In", onPressed: (){
                controller.signIn();
                
              }) ,
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Do you have an account? ",
                 style: Theme.of(context).textTheme.titleSmall) ,
                InkWell(onTap: () {
                  controller.goTosignUp();
                },
                child: Text("   Sing Up" ,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.red))), 
              ],)
            
              
           
          ],
                ),
        )),)
     
      ) )
    );
  }
}