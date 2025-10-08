import 'package:bloomy/controller/favoritecontroller.dart';
import 'package:bloomy/controller/offers_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/view/screen/home.dart';

import 'package:bloomy/view/widget/customappbar.dart';

import 'package:bloomy/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ ربط الكنترولرز
    Get.put(OffersController());
    Get.put(FavoriteController());

    return GetBuilder<OffersController>(
        builder: (controller) =>  Container(
           padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
             
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
             !controller.isSearch ?

             HandlingDataView(statusRequest: controller.statusRequest,
              widget:ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.data.length,
              itemBuilder: (context , index)=>
              CustomListItemsOffers(itemsModel: controller.data[index], 
              heroTag:  "offer_${controller.data[index].itemsId}_$index",)
              ) )
              : ListItemsSearch(listDataModel: controller.listdata)
            
              
            
              ],
            ),
          )
              
          
        
      
    );
  }
}

