import 'package:bloomy/controller/favoritecontroller.dart';
import 'package:bloomy/controller/itemscontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/data/model/items.dart';



import 'package:bloomy/view/widget/customappbar.dart';
import 'package:bloomy/view/widget/items/customlistitems.dart';
import 'package:bloomy/view/widget/items/listcategoriesitems.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(ItemscontrollerImp());
    FavoriteController controllerFavorite = Get.put( FavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child:ListView(
          children: [
            // CustomAppBar(
            //   titleAppBar: "Find Products",
            //   // onPressedIcon: () {},
            //   onPressedSearch: () {}, onPressedIconFavorite: () {  },
            // ),
            SizedBox(height: 20),
            ListCategoriesItems(),
            GetBuilder<ItemscontrollerImp>(builder: (controller)=>
        HandlingDataView(statusRequest: controller.statusRequest,
        widget: 
             SizedBox(
              child: GridView.builder(
                itemCount: controller.data.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6, // أقل لتوسيع الارتفاع (الصورة تأخذ مساحة أكبر)
                ),
                itemBuilder: (BuildContext context, int i) {
                   final itemModel = ItemsModel.fromJson(controller.data[i]);
                  controllerFavorite.isFavorite[controller.data[i]['Items_id']] = controller.data[i]['favorite'] ;
                  return 
            CustomListItems(
           itemsModel: itemModel,
    heroTag: "product_${itemModel.itemsId}_$i",
              );} )),))
          
          ],
        ),)
      
    );
  }
}
