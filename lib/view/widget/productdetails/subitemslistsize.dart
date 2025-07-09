

import 'package:bloomy/controller/productdetailscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/appcolor.dart';

class SubItemsSizeList extends GetView<ProductDetailsControllerImp> {
  const SubItemsSizeList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  ... List.generate(controller.subItems.length, (index)=>
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(bottom: 5),
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        color: controller.subItems[index]['active'] == "1" ? AppColor.primaryColor : 
                      AppColor.backgroundColor ,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.primaryColor , 
                      ) , 
                    
                    ),
                    child: Text("${controller.subItems[index]['name']}", style: TextStyle(
                      fontFamily:"sans" , 
                      color: controller.subItems[index]['active'] == "1" ? AppColor.backgroundColor : 
                      AppColor.primaryColor 
                    ),),
                  ))
                ],) ;
  }
}