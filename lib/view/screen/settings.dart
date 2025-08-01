
import 'package:bloomy/controller/settingscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController()) ;
    return Container(
   
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.center ,
            clipBehavior: Clip.none ,
            children: [
              Container(height: Get.width/2 ,
              color: AppColor.green, 
              
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
              
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("Disable Notifications" , ) ,
                   
                    trailing: Switch(value: true, onChanged: (Val){}),),
                ),
                // Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("Address") , 
                   onTap: () {},
                    trailing: Icon(Icons.location_on_outlined),
                  ),
                ),
                // Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("About Us"), 
                   onTap: () {},
                    trailing: Icon(Icons.help_outline_outlined),),
                ),
                // Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("Contact Us") , 
                   onTap: () {},
                    trailing: Icon(Icons.phone_callback_outlined),),
                ),
                // Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(
                   
                    title: Text("Logout"),
                     onTap: () {
                      controller.logout();
                     },
                    trailing: Icon(Icons.exit_to_app_outlined),
                  ),
                ),
              
            ],
          ))
        ],
      ),
    );
  }
}