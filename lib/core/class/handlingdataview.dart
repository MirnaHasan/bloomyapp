import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    super.key, 
    required this.statusRequest, 
    required this.widget,
    this.isCartPage = false, // 👈 باراميتر جديد
  });

  final StatusRequest statusRequest; 
  final Widget widget;
  final bool isCartPage;

  @override
  Widget build(BuildContext context) {
    return  
      statusRequest == StatusRequest.loading 
        ? Center(
            child: isCartPage 
              ? Lottie.asset(AppImage.pinkshoppingcart, width: 200, height: 200) // 👈 عربة لو كارت
              : Lottie.asset(AppImage.loading, width: 200, height: 200), // 👈 لودينج عادي
          )
        : statusRequest == StatusRequest.failure 
          ? Center(child: Lottie.asset(AppImage.noData , width: 200 , height: 200)) 
        : statusRequest == StatusRequest.offlineFailure 
          ? Center(child: Lottie.asset(AppImage.offline , width: 200 , height: 200)) 
        : statusRequest == StatusRequest.serverfailure 
          ? Center(child: Lottie.asset(AppImage.serverfailure , width: 200 , height: 200)) 
        : widget;
  }
}



class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({
    super.key, 
    required this.statusRequest, 
    required this.widget,
    this.isCartPage = false, // 👈 نفس الباراميتر
  });

  final StatusRequest statusRequest; 
  final Widget widget;
  final bool isCartPage;

  @override
  Widget build(BuildContext context) {
    return  
      statusRequest == StatusRequest.loading 
        ? Center(
            child: isCartPage 
              ? Lottie.asset(AppImage.ShoppingCart, width: 200, height: 200) // 👈 عربة لو كارت
              : Lottie.asset(AppImage.loading, width: 200, height: 200), // 👈 لودينج عادي
          )
        : statusRequest == StatusRequest.offlineFailure 
          ? Center(child: Lottie.asset(AppImage.offline , width: 200 , height: 200)) 
        : statusRequest == StatusRequest.serverfailure 
          ? Center(child: Lottie.asset(AppImage.serverfailure , width: 200 , height: 200)) 
        : widget;
  }
}
