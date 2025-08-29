


import 'package:bloomy/controller/cart_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appimages.dart' show AppImage;
import 'package:bloomy/view/widget/cart/custombootomnavigatinbarcart.dart';

import 'package:bloomy/view/widget/cart/customitemscardlist.dart';

import 'package:bloomy/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
   CartController cartcontroller= Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
      
        title: Text(
          
          "My Cart" ,
        ),
      ),
      bottomNavigationBar: 
      GetBuilder<CartController>(builder: (controller)=>
      CustomBottomNavigationBarCart(
        price: "${cartcontroller.priceorders}",
        discount: "${controller.discountcoupon.toString()}%",
        totalprice: "${controller.gettotalprice()}", 
        controllercoupon: controller.controllerCoupon,
         onApplyCoupon: controller.checkCoupon, shipping: '10',
      ),) ,
      
      body: GetBuilder<CartController>(builder: (cartcontroller)=>HandlingDataView
      (
        statusRequest: cartcontroller.statusRequest, 
        isCartPage: true,
    
       widget: ListView(
        children: [
     
          SizedBox(height: 20),
          TopCardCart(message: "You Have ${cartcontroller.totalCountItems} Items In Your List "),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
               ...List.generate(
                cartcontroller.data.length , 
                (index)=> CustomItemsCardList(
                  name: "${cartcontroller.data[index].itemsName}",
                  price: "${cartcontroller.data[index].itemsprice}",
                  count: "${cartcontroller.data[index].countitems}", imageName:"${cartcontroller.data[index].itemsImage}",
                   onAdd: () async{await cartcontroller.add( "${cartcontroller.data[index].itemsId}"); 
                   cartcontroller.refreshPageCart();
                   },
                    onRemove: () async{await cartcontroller.delete( "${cartcontroller.data[index].itemsId}"); 
                    cartcontroller.refreshPageCart(); },
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
