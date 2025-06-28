

import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/data/model/categories.dart';
import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(HomeComtrollerImp());
    return Scaffold(
      body: GetBuilder<HomeComtrollerImp>(builder: (controller)=> 
      HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
         padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
             
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
            Container( 
             margin: EdgeInsets.symmetric(vertical: 25 ),
              child: Stack(children: [
                Container(
                  alignment: Alignment.center,
                  height: 180 , 
                decoration: BoxDecoration(
                  color: AppColor.green , 
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ListTile(
                  title: Text("A Summer Surprise" , style: TextStyle(
                    fontSize: 24 , 
                    color: Colors.white
                  ),),
                  subtitle: Text("Discount 20%" , style: TextStyle(
                    color: Colors.white , 
                    fontSize: 32
                  ),),
                ),
                ) , 
                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    color: const Color.fromARGB(255, 131, 182, 70)
                  ),
                ))

            ],),) , 
            Container(
              height: 200,
              child: ListView.builder(
                
                scrollDirection: Axis.horizontal,
              itemCount:  controller.categories.length,
              itemBuilder:(context , index){
                print("${linkApi.linkimages}/${controller.categories[index]['categories_image']}");

                return Container(
                  height: 300,
                  child: 
                  SvgPicture.network("${linkApi.linkimages}/${controller.categories[index]['categories_image']}"),

                ) ;
              }
              
              
              ),)
            
          
          
          ],
        ),
      ))
    ));
   
  }
}