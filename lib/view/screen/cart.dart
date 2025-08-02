

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Cart" , style: TextStyle(
              fontSize: 25 , 
             
            ),)) ,
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(AppImage.logoImage)) ,
                            Expanded(
                              flex: 3,
                              child: ListTile(
                              title: Text("gardenia flowers",style:  TextStyle(fontSize: 15 ) ) , 
                              subtitle: Text("200 \$" , style:  TextStyle(fontSize: 18, color: AppColor.green ))
                            )) ,
                              Expanded(child: Column(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add)) , 
                                  Container(
                                    child: Text("2" , style: TextStyle(
                                      fontFamily: 'sans' ,
                                    ),)) ,
                                      IconButton(onPressed: (){}, icon: Icon(Icons.remove)) ,  
                                ],
                              )) ,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ],),
    );
  }
}