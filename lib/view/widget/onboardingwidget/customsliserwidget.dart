

import 'package:bloomy/controller/onboardingcontroller.dart';
import 'package:bloomy/data/datasourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSliderOnBoarding extends GetView <OnBoardingControllerImp > {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
   
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
    controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Image.asset(
                onBoardingList[i].image,
                height: 400,
                width: double.infinity,
                fit: BoxFit.fill,
              ),

              SizedBox(height: 30),
              Text(onBoardingList[i].title ,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
    );
  }
}