

import 'package:bloomy/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/approutes.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:ListView(
          children: [
              CustomAppBar(titleAppBar: "Find Products", onPressedIcon:(){}, onPressedSearch:(){}, 
           onPressedIconFavorite: () { Get.toNamed(AppRoutes.myfavorite); },) ,
          ],
        ),),
    );
  }
}