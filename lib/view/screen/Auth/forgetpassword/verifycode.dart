

import 'package:bloomy/controller/forgetpasswordcontroller/verifycodecontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


class Verifycode extends StatelessWidget {
  const Verifycode({super.key});
  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodeControllerImp>(builder: (controller)=>
      HandlingDataRequest(statusRequest: controller.statusRequest,
       widget:  Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Form(
          // key: controller.formState,
          child: ListView(
            children: [
              SizedBox(height: 40),
              Text(
                textAlign: TextAlign.center,
          
                "Verification Code",
          
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              CustomTextAuth(title: "Check Code"),
              SizedBox(height: 40),
          
              CustomTextBody(
                text: "Please Enter The Digit Code Sent To mirna@gmail.com",
              ),
              SizedBox(height: 40),
              OtpTextField(
                borderWidth: 2,
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
              
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToResetPassword(verificationCode);
                }, // end onSubmit
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),)
      )
     
    );
  }
}
