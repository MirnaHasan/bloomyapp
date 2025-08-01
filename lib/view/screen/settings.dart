
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
   
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.center ,
            clipBehavior: Clip.none ,
            children: [
              Container(height: Get.width/2 ,
              color: AppColor.primaryColor , 
              
              ) , 
            Positioned(
              top:  Get.width/ 2.8 ,
              child: Container(
                padding: EdgeInsets.all(4) ,
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor ,
          borderRadius: BorderRadius.circular(100) ,
                ),
                child: CircleAvatar(
                  radius:60 ,
                  backgroundColor: AppColor.backgroundColor ,
                  backgroundImage: AssetImage(AppImage.avatar) ,
                
                        ),
              ) ,
            )
            ],
          ),
          SizedBox(height:100 ) ,
          Card(child: Column(
            mainAxisSize:MainAxisSize.min , 
            children: [
              
              Container(padding: EdgeInsets.symmetric(horizontal: 10 ) , 
                child: ListTile(title: Text("one") , )),
                Divider() ,
                  Container(padding: EdgeInsets.symmetric(horizontal: 10 ) , 
                child: ListTile(title: Text("one") , )),
                Divider() ,  Container(padding: EdgeInsets.symmetric(horizontal: 10 ) , 
                child: ListTile(title: Text("one") , )),
                Divider() ,  Container(padding: EdgeInsets.symmetric(horizontal: 10 ) , 
                child: ListTile(title: Text("one") , )),
              
            ],
          ))
        ],
      ),
    );
  }
}