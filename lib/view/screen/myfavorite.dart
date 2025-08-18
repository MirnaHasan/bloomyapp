

import 'package:bloomy/controller/myfavoritecontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/view/screen/home.dart';
import 'package:bloomy/view/widget/customappbar.dart';
import 'package:bloomy/view/widget/myfavorite/customlistfavoriteitems.dart';
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
             CustomAppBar(
          titleAppBar: "Find Products",
          onPressedSearch:(){
            controller.onSearchItems() ;
          }, 
          onPressedIconFavorite: () { Get.toNamed(AppRoutes.myfavorite); },
           onChanged: ( val) {
            controller.checkSearch(val) ;
             }, 
           mycontroller: controller.search,

           ) ,
           SizedBox(height: 20,) ,
           HandlingDataView(statusRequest: controller.statusRequest,
            widget: 
            !controller.isSearch ?
            GridView.builder(
              
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: 0.6),
              
             itemBuilder: (context , index) => CustomListFavoriteItems(itemsModel: controller.data[index])  ): 
             ListItemsSearch(listDataModel: controller.listdata) , 
             )
          ],
        ),)
   
        ),
    );
  }
}