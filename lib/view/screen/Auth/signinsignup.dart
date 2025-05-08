



import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/view/widget/signupsignin/custombuttonsigninsignup.dart';
import 'package:bloomy/view/widget/signupsignin/customsigninsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class signInsignUp extends StatelessWidget {
  const signInsignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        child: Column(
          children: [
            CustomSigninSignUp(title: "Welcome To Bloomy Store",
             imageUrl: "assets/images/imagefour.jpg") , 
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomMaterialSigninUp(textbutton: "Sign In", onPressed: (){
                Get.toNamed(AppRoutes.signInScreen);
              }) , 
                 CustomMaterialSigninUp(textbutton: "Sign Up", 
                 onPressed: (){ Get.toNamed(AppRoutes.signUpScreen);}) , 
          ],)
  
           ]),
           
          
           
          
        ),
      );
    
  }
}
