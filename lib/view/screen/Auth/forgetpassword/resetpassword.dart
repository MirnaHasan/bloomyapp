
import 'package:bloomy/controller/forgetpasswordcontroller/resetpasswordcontroller.dart';
import 'package:bloomy/core/functions/validinput.dart';

import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: 
        Form(
          key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 40),
              Text(
                textAlign: TextAlign.center,
          
                "Reset Password",
          
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              CustomTextAuth(title: "New Password"),
              SizedBox(height: 40),
                 CustomTextBody(text: "Please Enter New Password"),
                  SizedBox(height: 40),
              CustomMaterialButtonAuth(
                  isNumber: false,
                valid: (val) { return validInput(val!, 6, 20, "password"); },
                labelText: "Password",
                hintText: "Enter your password",
                icon: Icon(Icons.lock_clock_outlined),
                myController: controller.password,
              ),
             SizedBox(height: 40),
          
              CustomMaterialButtonAuth(
                  isNumber: false,
                 valid: (val) { return validInput(val!, 6, 20, "password"); },
                labelText: "Password",
                hintText: "Re-enter your password",
                icon: Icon(Icons.lock_clock_outlined),
                myController: controller.repassword,
              ),
            
              SizedBox(height: 80),
              CustomTextSigninOrSignUp(textbutton: "Save", onPressed: () {
                controller.goToSuccessResetPassword();
              }),
            
            ],
          ),
        ),
      ),
    );
  }
}
