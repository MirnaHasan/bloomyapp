
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/view/widget/cart/custombuttoncart.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarCart extends StatelessWidget {
  final String price ;
  final String shipping ;
  final String totalprice ;
  const CustomBottomNavigationBarCart({super.key, required this.price, required this.shipping, required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text( "price", style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$" ,  style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
            ],) , 
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container( padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text( "shipping", style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
              Container(  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping \$" ,  style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
            ],) , 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: Colors.black,)) ,
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("totalprice"  , style: TextStyle(
                  color: AppColor.green,
                   fontFamily: 'sans' ,
                  
                ),),
              ) , 
              Container(  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$" ,  style: TextStyle(
                  color: AppColor.green,
                 
                   fontFamily: 'sans' ,
                ),),
              ) , 
              
            ],) , 
             SizedBox(height: 20,) ,
            CustomButtonCart(textButton: "Place Order", onPressed: (){}) , 
           
          ],
        ),
      );
  }
}