


import 'package:bloomy/controller/forgetpasswordcontroller/forgetpasswordcontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/validinput.dart';
import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  @override
  Widget build(BuildContext context) {
 Get.put(
      ForgetPasswordControllerImp(),
    );
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller)=>
      HandlingDataRequest(statusRequest: controller.statusRequest, 
      widget:Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 40),
              Text(
                textAlign: TextAlign.center,

                "Forget Password",

                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 50),
              CustomTextAuth(title: "Check Your Email"),
              SizedBox(height: 35),

              CustomTextBody(
                text: "Please Enter Your Email To Recieve Verification Code ",
              ),
              SizedBox(height: 40),
              CustomMaterialButtonAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 8, 20, "password");
                },
                labelText: "Email",
                hintText: "Enter your email",
                icon: Icon(Icons.email_outlined),
                myController: controller.email,
              ),

              SizedBox(height: 40),

              CustomTextSigninOrSignUp(
                textbutton: "Check ",
                onPressed: () {
                  controller.checkEmail();
                },
              ),
            ],
          ),
        ),
      ),
       )
    
      
      )
    );
  }
}
