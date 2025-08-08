import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  const TopCardCart({super.key, required this.message});
  final String message ; 

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.only(bottom: 5),
              margin: EdgeInsets.symmetric(horizontal: 20),
             
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20) , 
              color: AppColor.greenAccent

            ),
            child: Text(message , 
            
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal
              // fontFamily: 'sans'
            ),
            textAlign: TextAlign.center),) ;
  }
}