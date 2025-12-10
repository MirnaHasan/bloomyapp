

import 'package:bloomy/controller/productdetailscontroller.dart';

import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPageItemsDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Stack(
            clipBehavior: Clip.none,
            children: [
              // خلفية علوية
              Container(
                height: 300,
                decoration: BoxDecoration(
               
                   
                  color:  Colors.green.shade700, 
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),

              // صورة المنتج
              Positioned(
                 top: 10,
                left: Get.width * 0.1,
                right: Get.width * 0.1,
                child: Hero(
                    tag: controller.heroTag ,  
                  // tag: "${controller.itemsModel.itemsId}",
                  child: ClipRRect(
                    
                    borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(20) , 
                      bottomRight: Radius.circular(20) , 

                    ),
                    child: Image.network(
                      "${linkApi.linkitemsimages}/${controller.itemsModel.itemsImage}",
                      
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