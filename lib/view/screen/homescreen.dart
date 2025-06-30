

import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
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
          SizedBox(
            

              height:  210,
              width: 170,
              child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 40,),
                
              scrollDirection: Axis.horizontal,
              itemCount:  controller.categories.length,
              itemBuilder:(context , index){
                print("${linkApi.linkimages}/${controller.categories[index]['categories_image']}");

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color:AppColor.greenAccent ,
                       borderRadius: BorderRadius.circular(20
                       ),
                      ), 
                    
                      width: 160 ,
                      height: 160 , child: ClipRRect(   borderRadius: BorderRadius.circular(20) ,
                    
                      child:Image.network(
                               width: 160 ,
                      height: 160 ,
                    
                        "${linkApi.linkimages}/${controller.categories[index]['categories_image']}" ,
                        fit: BoxFit.cover) )
                    
                    
                    ),
                    SizedBox(height: 10) ,
                     Text(
                      textAlign: TextAlign.center ,
                      style: TextStyle (
                        fontSize:  16 , 
                        color: AppColor.green , ) , 
                      
                      "${controller.categories[index]['categories_name' ] }") , 
                 
                  ],
                ) ;
              }
              
              
              ),) , 
                 
                      Text("Flowers For You", style: TextStyle( fontSize:  20,fontWeight: FontWeight.bold ,
                        color: AppColor.green ))
                       ,
            SizedBox(height: 10 ) , 
          SizedBox(
  height: 200,
  child: ListView.separated(
    separatorBuilder: (context, index) => SizedBox(width: 5),
    scrollDirection: Axis.horizontal,
    itemCount: 4,
    itemBuilder: (context, i) {
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 170,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(AppImage.imageproduct),
                fit: BoxFit.cover, // ✅ تملأ الحاوية بالكامل
              ),
            ),
          ),
          Container(
            height: 170,
            width: 150 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Positioned(
          left:10, 
          bottom: 40 ,
         
            child: Text(
              "Flowers",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 39, 39, 39),
              ),
            ),
          ),
        ],
      );
    },
  ),
)

          
          
          ],
        ),
      ))
    ));
   
  }
}