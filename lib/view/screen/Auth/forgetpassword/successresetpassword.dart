

import 'package:bloomy/controller/Authcontroller/successresetpasswordcontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';
import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
     SuccessResetPasswordControllerImp controller = Get.put( SuccessResetPasswordControllerImp());
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Success Reset Password" , 
        style: Theme.of(context).textTheme.titleLarge,
      ),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Icon(Icons.check_circle_outlined , size: 200,
              color: AppColor.green,),
            ) , 
            SizedBox(height: 70,) , 
            CustomTextAuth(title: "تم تغيير كلمة السر  بنجاح") ,
            Spacer() , 
            CustomTextSigninOrSignUp(textbutton: " Go To Sign In", onPressed: (){
            controller.goToSignInPage();
           
          }) ,
          SizedBox(height: 50,)

          ],
        ),
      )
    );
  }
}