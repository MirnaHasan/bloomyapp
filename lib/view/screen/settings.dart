
import 'package:bloomy/controller/settingscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController()) ;
    return Scaffold(
   appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center ,
            clipBehavior: Clip.none ,
            children: [
              Container(
                height: Get.width/3 ,
              
              color:  
      Colors.green.shade700, 
              
              ) , 
            Positioned(
              top:  Get.width/ 5.5 ,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("Orders") , 
                   onTap: () {
                     Get.toNamed(AppRoutes.pendingorders) ;
                   },
                    trailing: Icon(Icons.shopping_cart_checkout_outlined , color: Colors.green.shade700,),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("Archive Orders") , 
                   onTap: () {
                  Get.toNamed(AppRoutes.archiveorders) ;
                   },
                    trailing: Icon(Icons.archive_sharp, color: Colors.green.shade700, ),
                  ),
                ),
                // Divider(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListTile(title: Text("Address") , 
                   onTap: () {
                    Get.toNamed(AppRoutes.addressView) ;
                   },
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
                   onTap: () async{
                   await  launchUrl(Uri.parse("tel:+963994281581"));
                   },
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