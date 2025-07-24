

import 'package:bloomy/controller/myfavoritecontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController() ) ;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(builder: (controller)=>     ListView(
          children: [
              CustomAppBar(titleAppBar: "Find Products", onPressedIcon:(){}, onPressedSearch:(){}, 
           onPressedIconFavorite: () { Get.toNamed(AppRoutes.myfavorite); },) ,
           HandlingDataView(statusRequest: controller.statusRequest,
            widget: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
             itemBuilder: (context , index) => Text(controller.data[index].itemsName!)  ))
          ],
        ),)
   
        ),
    );
  }
}