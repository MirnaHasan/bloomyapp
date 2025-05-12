

import 'package:bloomy/controller/Authcontroller/successsignupcontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/view/widget/auth/customtextauth.dart';

import 'package:bloomy/view/widget/auth/customtextsigninorsignup.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SuceessSignUp extends StatelessWidget {
  const SuceessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put( SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Success Sign Up" , 
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
            CustomTextAuth(title: "تم التأكد من بريدك الإلكتروني بنجاح") ,
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