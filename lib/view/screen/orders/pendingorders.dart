

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class OrdersCartCheckOut extends StatelessWidget {
  const OrdersCartCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Orders  CheckOut" , 
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