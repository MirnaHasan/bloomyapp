

import 'package:bloomy/controller/homescreencontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/approutes.dart';

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
              backgroundColor: AppColor.green,
              onPressed: () {
                Get.toNamed(AppRoutes.cart) ;
              },
              child: Icon(
                Icons.shopping_basket_outlined,
                color: const Color.fromARGB(255, 60, 122, 62),
              ),
            ),
            bottomNavigationBar: CustomBottomAppBarHome(),
            body: controller.listPage.elementAt(controller.currentpage),
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