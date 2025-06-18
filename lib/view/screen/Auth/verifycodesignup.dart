


import 'package:bloomy/controller/verifycodesignupcontroller.dart';
import 'package:bloomy/core/class/statusrequest.dart';

import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';



class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp ({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller)=> 
      controller.statusRequest == StatusRequest.loading ?
      Center(child: Text("Loading ...")) : Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
              text: "Please Enter The Digit Code Sent To ${controller.email} ",
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
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                 print("🔐 CODE ENTERED BY USER: [$verificationCode]");
                controller.goToSuccessSignUp(verificationCode);
              }, // end onSubmit
            ),
            SizedBox(height: 40),
          ],
        ),
      ), 
      )
    );
  }
}
