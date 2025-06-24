import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});
 final StatusRequest statusRequest ; 
  final Widget widget ;

  @override
  Widget build(BuildContext context) {
    return  
    statusRequest == StatusRequest.loading ? Center(child: Lottie.asset(AppImage.loading , width: 250 , height: 250)) : 
    statusRequest == StatusRequest.failure ? Center(child:  Lottie.asset(AppImage.noData , width: 250 , height: 250) ) :
    statusRequest == StatusRequest.offlineFailure ? Center(child:  Lottie.asset(AppImage.offline , width: 250 , height: 250)) :
    statusRequest == StatusRequest.serverfailure ? Center(child:  Lottie.asset(AppImage.serverfailure , width: 250 , height: 250)) : widget

    
    ;
  }
}



class HandlingDataRequest extends StatelessWidget {
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});
 final StatusRequest statusRequest ; 
  final Widget widget ;

  @override
  Widget build(BuildContext context) {
    return  
    statusRequest == StatusRequest.loading ? Center(child: Lottie.asset(AppImage.loading , width: 250 , height: 250)) : 

    statusRequest == StatusRequest.offlineFailure ? Center(child:  Lottie.asset(AppImage.offline , width: 250 , height: 250)) :
    statusRequest == StatusRequest.serverfailure ? Center(child:  Lottie.asset(AppImage.serverfailure , width: 250 , height: 250)) :
     widget

    
    ;
  }
}