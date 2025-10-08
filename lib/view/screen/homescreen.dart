

import 'dart:io';

import 'package:bloomy/controller/homescreencontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/showsnackbar.dart';

import 'package:bloomy/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(
      builder:(controller) => Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              
              shape: CircleBorder(),
              elevation: 5,
              
              onPressed: () {
                Get.toNamed(AppRoutes.cart) ;
              },
              child: Icon(
                Icons.shopping_basket_outlined,
                color:  Colors.green.shade200, 
              ),
            ),
            bottomNavigationBar: CustomBottomAppBarHome(),
            body: WillPopScope(child: controller.listPage.elementAt(controller.currentpage),
             onWillPop: (){
             Get.defaultDialog(
                  title: "هل تريد مغادرة المتجر؟ 🌿",
                  titleStyle: TextStyle(
                    color: AppColor.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  middleText: "نأسف لرؤيتك تغادر! هل ترغب بالخروج من التطبيق؟",
                  middleTextStyle: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 15,
                  ),
                  backgroundColor: Colors.white,
                  radius: 15,
                  confirmTextColor: Colors.white,
                  cancelTextColor: AppColor.greenAccent,
                  textConfirm: "خروج",
                  textCancel: "إلغاء",
                  buttonColor: AppColor.greenAccent,
                  onConfirm: () {
                    exit(0);
                  },
                  onCancel: () {},
                );

      
              return Future.value(false) ;
             })
          ),
    );
  }
}


        // Row(
            //   children: [
            //   CustomBottomAppBar("Home", Icons.home, (){controller.changepage(0);},
            //    controller.currentpage == 0 ? true : false ) , 
            //    CustomBottomAppBar("Settings", Icons.settings, (){controller.changepage(1);}, controller.currentpage ==1 ? true : false) ,
            //   ],
            // ),
            // Spacer() , 
            //   Row(
            //   children: [
            //  CustomBottomAppBar("Profile", Icons.person_off_outlined, (){controller.changepage(2);}, 
            //  controller.currentpage == 2 ? true : false 
            //  ) , 
            //  CustomBottomAppBar("Favourite", Icons.favorite_outline_outlined, (){controller.changepage(3);}, controller.currentpage==3 ?true : false),
            //   ],
            // ),