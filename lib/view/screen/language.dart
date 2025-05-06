


import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/localization/changelocale.dart';
import 'package:bloomy/view/widget/language/customlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageApp extends GetView<ChangLocalController> {
  const LanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: CustomLanguage(
          text: "1".tr,
          textButtononelang: "2".tr,
          onPressedOne: () {
            controller.changeLanguage("ar");
            Get.toNamed(AppRoutes.onBoarding);
          },
          textButtontwolang: "3".tr,
          onPressedTwo: () {
            controller.changeLanguage("en");
            Get.toNamed(AppRoutes.onBoarding);
          },
        ),
      ),
    );
  }
}
