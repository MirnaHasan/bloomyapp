


import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/data/datasourse/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChanged(int index);

}

class OnBoardingControllerImp extends OnBoardingController{
late PageController pageController ;
  int currentPage = 0;
  @override
  
  next() {
currentPage++;
if(currentPage > onBoardingList.length-1 ){
      Get.offNamed(AppRoutes.signInScreen);
    }
  pageController.animateToPage(currentPage,
   duration: Duration(milliseconds: 900),
    curve: Curves.easeInOut);
    
  }

  @override
  onPageChanged(int index) {
   currentPage = index ;
   update();
  }

@override
  void onInit() {
  pageController = PageController();
    super.onInit();
  }




}