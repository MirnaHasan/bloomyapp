

import 'package:bloomy/controller/productdetailscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPageItemsDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
            clipBehavior: Clip.none,
            children: [
              // خلفية علوية
              Container(
                height: 200,
                decoration: BoxDecoration(
               
                   
                  color: AppColor.greenAccent ,
                  // borderRadius: BorderRadius.vertical(
                  //   bottom: Radius.circular(60),
                  // ),
                ),
              ),

              // صورة المنتج
              Positioned(
                 top: 40,
                left: Get.width * 0.1,
                right: Get.width * 0.1,
                child: Hero(
                    tag: controller.heroTag ,  
                  // tag: "${controller.itemsModel.itemsId}",
                  child: ClipRRect(
                    
                    borderRadius: BorderRadius.circular(
                     30
                    ),
                    child: Image.network(
                      "${linkApi.linkimages}/${controller.itemsModel.itemsImage}",
                      
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

            
            ],
          );
  }
}