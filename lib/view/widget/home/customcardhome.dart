import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeComtrollerImp> {
  final String titleCard ;
  final String bodyCard ;

  const CustomCardHome({super.key, required this.titleCard, required this.bodyCard});

  @override
  Widget build(BuildContext context) {
    return  Container( 
             margin: EdgeInsets.symmetric(vertical: 25 ),
              child: Stack(children: [
                Container(
                  alignment: Alignment.center,
                  height: 180 , 
                decoration: BoxDecoration(
                  color: AppColor.green , 
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ListTile(
                  title: Text(titleCard  , style: TextStyle(
                    fontSize: 24 , 
                    color: Colors.white
                  ),),
                  subtitle: Text(bodyCard , style: TextStyle(
                    color: Colors.white , 
                    fontSize: 32
                  ),),
                ),
                ) , 
                Positioned(
                  top: -20,
                  right:controller.lang == "en" ? -20: null,
                  left: controller.lang == "ar" ? -20: null, 
                  child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                     color: const Color.fromARGB(255, 131, 182, 70)
                  ),
                ))

            ],),) ;
  }
}