

import 'package:bloomy/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeComtrollerImp controller = Get.put(HomeComtrollerImp());
    return Scaffold(
      body:  Container(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
              Expanded(child: TextFormField(
                
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search) ,
                hintText:" Find products " , hintStyle:  TextStyle( fontSize: 18 ) ,
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                 borderSide: BorderSide.none,
                 borderRadius: BorderRadius.circular(20) ,
                
                )
              )

              )) ,
              SizedBox(width: 10 ) ,
                Container(  decoration: BoxDecoration(    
                  borderRadius:    BorderRadius.circular(10 ),
                   color: Colors.grey[200],) ,
                  width: 60 ,
               
                  padding: EdgeInsets.symmetric(vertical: 4) , 
                  child: IconButton(onPressed: (){} , 
            icon: Icon(Icons.notifications_active_outlined , size: 30  , color: Colors.grey[600] , )
            
            
            ),),
            ],),),
          
          ],
        ),
      )
    );
   
  }
}