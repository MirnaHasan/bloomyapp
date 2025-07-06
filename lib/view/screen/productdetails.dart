import 'package:bloomy/controller/productdetailscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
   ProductDetailsControllerImp controller =Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: Container(
        
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColor.greenAccent , 
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                ),
                ClipRRect(
                  
                  child: Image.network(
                    width: 500 , 
                    height: 300 , 
                    "${linkApi.linkimages}" + "/" + "${controller.itemsModel.itemsImage}"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}