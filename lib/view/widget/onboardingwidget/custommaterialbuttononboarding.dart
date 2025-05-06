

import 'package:bloomy/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomMaterialButtonOnBoarding extends GetView <OnBoardingControllerImp> {
   CustomMaterialButtonOnBoarding({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 80),
      child: MaterialButton(
                  
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 60 , vertical: 10),
                  color: const Color.fromARGB(255, 121, 167, 61),
                  onPressed: (){controller.next();}, 
                child: Text("Continue", 
                style: TextStyle(fontSize: 20),),
                ),
    );
  }
}