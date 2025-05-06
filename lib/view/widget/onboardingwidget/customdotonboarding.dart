

import 'package:bloomy/controller/onboardingcontroller.dart';
import 'package:bloomy/data/datasourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Column(children: [  
      GetBuilder<OnBoardingControllerImp>(builder: (controller)=>Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                         color: const Color.fromARGB(255, 121, 167, 61),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 8,
                      width: controller.currentPage == index ? 26 : 6 ,

                      duration: Duration(milliseconds: 900),
                    ),
                  ),
               
                ],),)
                ]);
                
  }
}