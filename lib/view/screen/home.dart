

import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/approutes.dart';

import 'package:bloomy/view/widget/customappbar.dart';
import 'package:bloomy/view/widget/home/customcardhome.dart';
import 'package:bloomy/view/widget/home/customtitlehome.dart';
import 'package:bloomy/view/widget/home/listcategorieshome.dart';
import 'package:bloomy/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeComtrollerImp());
    return GetBuilder<HomeComtrollerImp>(builder: (controller)=> 
      HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
         padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
           CustomAppBar(
            titleAppBar: "Find Products",
            // onPressedIcon:(){},
             onPressedSearch:(){}, 
           onPressedIconFavorite: () { Get.toNamed(AppRoutes.myfavorite); },) ,
           CustomCardHome(titleCard: "A Summer Surprise", bodyCard: "Discount 20%" ),
           CustomTitleHome(title: "Categories",),
           SizedBox(height: 16),
           ListCategoriesHome() ,
           CustomTitleHome(title: "Products For You",) ,
           SizedBox(height: 16),
           ListItemsHome(),
           SizedBox(height: 10),
           CustomTitleHome(title: "Offers",),
           SizedBox(height: 16),
           ListItemsHome(),
                  ],
                ),
              ),
            ), 
    );
   
  }
}