import 'package:bloomy/controller/productdetailscontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/functions/translatedatabase.dart';


import 'package:bloomy/view/widget/productdetails/toppageitemsdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/productdetails/priceandquantity.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(ProductDetailsControllerImp(),);

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 50,
        child: MaterialButton(
          color: AppColor.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          onPressed: () {
            // action here
          },
          child: Text(
            "أضف إلى السلة",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: GetBuilder<ProductDetailsControllerImp>
      (builder: (controller)=>HandlingDataView(statusRequest:controller.statusRequest ,
       widget: ListView(
        children: [
          TopPageItemsDetails(),
          SizedBox(height: 280),
          // بطاقة التفاصيل
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(31, 1, 1, 1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  translatFromDataBase(
                    "${controller.itemsModel.itemsNameAr}",
                    "${controller.itemsModel.itemsName}",
                  ),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  translatFromDataBase(
                    "${controller.itemsModel.itemsDescAr}",
                    "${controller.itemsModel.itemsDesc}",
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),
                PriceAndQuantityItems(
                  onAdd: () {
                    controller.cartController.add(controller.itemsModel.itemsId.toString());
                    controller.cartController.getcountitemscart(controller.itemsModel.itemsId.toString()) ;
                  },
                  onRemove: (){controller.cartController.delete((controller.itemsModel.itemsId.toString()));
                     controller.cartController.getcountitemscart(controller.itemsModel.itemsId.toString()) ;
                  
                  },
                  price: "${controller.itemsModel.itemsPrice}",
                  count: "${controller.countitems}",
                ),
              ],
            ),
          ),

          // SizedBox(height: 30,) ,
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Text(
          //     "Size",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: AppColor.primaryColor,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),

          // SubItemsSizeList(),
          SizedBox(height: 40),
        ],
      ),))
    );
  }
}
