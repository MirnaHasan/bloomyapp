

import 'package:bloomy/core/constant/appcolor.dart';

import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  final String imageName ; 
  final bool isActive ; 
 final String title ; 
  const CardDeliveryType({super.key, required this.imageName, required this.isActive, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
                  height: 130,
                  width: 140,
                  decoration: BoxDecoration(
                    color: isActive == true ?   const Color.fromARGB(255, 202, 238, 130) : null , 

                    
                    border: Border.all(color: AppColor.green, width: 2),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(imageName, width: 60  ,
                      color: isActive == true ? const Color.fromARGB(255, 254, 254, 254) : null ),
                      Text(
                        title,
                        style: TextStyle(color: isActive == true ? 
                         Colors.deepOrange : AppColor.greenAccent , 
                         fontWeight: isActive == true
                          ? FontWeight.bold : null 
                          ),
                      ),
                    ],
                  ),
                );
  }
}