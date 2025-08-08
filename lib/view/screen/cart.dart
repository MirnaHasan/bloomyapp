


import 'package:bloomy/view/widget/cart/custombootomnavigatinbarcart.dart';

import 'package:bloomy/view/widget/cart/customitemscardlist.dart';
import 'package:bloomy/view/widget/cart/topappbarcart.dart';
import 'package:bloomy/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBarCart(price: "1200", shipping: "300", totalprice: "1500") , 
      body: ListView(
        
        children: [
        TopAppBarCart(title: "My Cart" ),
            SizedBox(height: 10,) ,
            TopCardCart(message: "You Have 3 Items In Your List ") ,
            Container(
            padding: EdgeInsets.all(10),
              child: Column(
                children: [
                 CustomItemsCardList(name: "gardenia flowers", price: "200 \$", count: "2") ,
                  SizedBox(height: 20,) ,
                    CustomItemsCardList(name: "Jepsophelia flowers", price: "290 \$", count: "6") ,
                  
                ],
              ),
            )
        ],),
    );
  }
}