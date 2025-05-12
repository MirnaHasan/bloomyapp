

/// من أجل التحقق من البريد الأكتروني الذي يتم ادخاله عند انشاء الحساب يا ميرررنااااا :)
 
 

import 'package:bloomy/controller/Authcontroller/checkemailcontroller.dart';


import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextbodyauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});
  @override
  Widget build(BuildContext context) {
   CheckEmailControllerImp Controller = Get.put(CheckEmailControllerImp());
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Text(
              textAlign: TextAlign.center,

              "Check Email",

              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 50),
            CustomTextAuth(title: "Success Sign Up"),
               SizedBox(height: 35),

            CustomTextBody(text: "Please Enter Your Email To Recieve Verification Code "),
            SizedBox(height: 40),
            CustomMaterialButtonAuth(
              labelText: "Email",
              hintText: "Enter your email",
              icon: Icon(Icons.email_outlined),
              myController: Controller.email,
            ),
          
            SizedBox(height: 40),

         
       
        
            CustomTextSigninOrSignUp(
              textbutton: "Check ",
              onPressed: () {
                Controller.goToVerifySignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
