

import 'package:bloomy/controller/orders/pendingorderscontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';


// ignore: must_be_immutable
class PendingOrders extends StatelessWidget {
   PendingOrders({super.key});
  PendingOrdersController controller = Get.put(PendingOrdersController()) ; 

///pending orders تستخدم لعرض كل المنتجات المعلقة اي الموجودة في جدول الorders
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Pending Orders" , 
            ),
            Icon(Icons.shopping_cart_checkout_sharp , )
          ],
        ),
      ),
      body: 
      Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Orderrrssssssssssssssssssssssssssss")
          ],
        ))
    );
  }
}