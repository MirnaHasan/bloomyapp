
import 'package:bloomy/controller/onboardingcontroller.dart';
import 'package:bloomy/view/widget/onboardingwidget/customdotonboarding.dart';
import 'package:bloomy/view/widget/onboardingwidget/custommaterialbuttononboarding.dart';
import 'package:bloomy/view/widget/onboardingwidget/customsliserwidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 3, child: CustomSliderOnBoarding()),

            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotOnBoarding(),
                  Spacer(),
                  CustomMaterialButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
