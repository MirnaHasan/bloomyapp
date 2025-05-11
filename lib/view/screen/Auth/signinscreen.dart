


import 'package:bloomy/controller/Authcontroller/signincontroller.dart';
import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:bloomy/view/widget/auth/logoauth.dart';


import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignInControllerImp controller = Get.put(SignInControllerImp());
    return Scaffold(

       appBar: AppBar(
        centerTitle: true,
        title: Text(
    
          "Sign In " , 
       
        style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
        child: ListView(
        
        children: [
          
          CustomTextAuth(title: "BLOOMY WELCOME YOU") ,
        SizedBox(height: 30,) ,
          CustomTextBody(text: "Sign in with your email and password") ,
          SizedBox(height: 40,),
         LogoAuth(),
          SizedBox(height: 30,) , 
          CustomMaterialButtonAuth(labelText: "Email", hintText:  "Enter your email",
           icon:  Icon(Icons.email_outlined), myController: controller.email,),
          SizedBox(height: 20,),

        CustomMaterialButtonAuth(labelText: "Password", hintText:  "Enter your password",
           icon:  Icon(Icons.lock_clock_outlined), myController: controller.password,),
          SizedBox(height: 30,), 
          InkWell(
          onTap: () {
            controller.goToForgetPaaword();
          },
            child: Text( textAlign: TextAlign.right ,
              "Forgot password ? ", style: Theme.of(context).textTheme.titleSmall),
          ) ,
               SizedBox(height: 50,),
            CustomTextSigninOrSignUp(textbutton: "Sign In", onPressed: (){
              controller.signIn();
              
            }) ,
          
            
         
        ],
      )),
    );
  }
}