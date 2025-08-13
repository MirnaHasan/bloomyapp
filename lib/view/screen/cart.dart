


import 'package:bloomy/controller/cart_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/view/widget/cart/custombootomnavigatinbarcart.dart';

import 'package:bloomy/view/widget/cart/customitemscardlist.dart';
import 'package:bloomy/view/widget/cart/topappbarcart.dart';
import 'package:bloomy/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
   CartController cartcontroller= Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBarCart(
        price: "${cartcontroller.priceorders}",
        shipping: "300",
        totalprice: "1500",
      ),
      body: GetBuilder<CartController>(builder: (cartcontroller)=>HandlingDataView
      (statusRequest: cartcontroller.statusRequest , widget: ListView(
        children: [
          TopAppBarCart(title: "My Cart"),
          SizedBox(height: 10),
          TopCardCart(message: "You Have ${cartcontroller.totalCountItems} Items In Your List "),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
               ...List.generate(
                cartcontroller.data.length , 
                (index)=> CustomItemsCardList(
                  name: "${cartcontroller.data[index].itemsName}",
                  price: "${cartcontroller.data[index].itemsPrice}",
                  count: "${cartcontroller.data[index].countitems}", imageName:"${cartcontroller.data[index].itemsImage}",
                ),
              
               ) ,
                SizedBox(height: 20),
              
              ],
            ),
          ),
        ],
      ),))
    );
  }
}
