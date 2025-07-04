

import 'package:bloomy/controller/itemscontroller.dart';
import 'package:bloomy/view/widget/customappbar.dart';

import 'package:bloomy/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put (ItemscontrollerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
         CustomAppBar(titleAppBar: "Find Products",
          onPressedIcon: (){}, onPressedSearch: (){}) ,
              SizedBox(height: 20),
          ListCategoriesItems() , 
          
          ],
        ),
      ),
    );
  }
}