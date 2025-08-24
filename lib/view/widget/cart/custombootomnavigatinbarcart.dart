
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/view/widget/cart/custombuttoncart.dart';
import 'package:bloomy/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarCart extends StatelessWidget {
  final String price ;
  final String discount ;
  final String totalprice ;
  final String shipping ;
  final void Function()?  onApplyCoupon ;
  final TextEditingController  controllercoupon ; 
  const CustomBottomNavigationBarCart({super.key, required this.price, required this.discount, 
  required this.totalprice, required this.controllercoupon,required this.onApplyCoupon, required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: controllercoupon,
                  decoration: InputDecoration(
                    hintText: "Coupon Name",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.greenAccent ,width: 2 ,
                       style: BorderStyle.solid )
                    ) , 
                    
                  ),
                  )) , 
                  SizedBox(width: 10,) , 
                Expanded(
                  flex: 1,
                  child: CustomButtonCoupon(textButton: "Apply", onPressed: onApplyCoupon)) , 
              ],),
            ) , 
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greenAccent , width: 4)
              ),
              child: Column(
              children: [ 
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text( "Price", style: TextStyle(
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
                child: Text( "Discount", style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
              Container(  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$discount " ,  style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
            ],) , 
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text( "Shipping", style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping \$" ,  style: TextStyle(
                   fontWeight: FontWeight.normal ,
                   fontFamily: 'sans' ,
                ),),
              ) , 
            ],) , 
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: AppColor.greenAccent,)) ,
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total price"  , style: TextStyle(
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
                       
            
            ],
            ),) , 
             SizedBox(height: 20,) ,
            CustomButtonCart(textButton: "Place Order", onPressed: (){}) , 
           
          ],
        ),
      );
  }
}