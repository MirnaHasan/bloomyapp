

import 'package:bloomy/view/screen/home.dart';
import 'package:bloomy/view/screen/notifications.dart';
import 'package:bloomy/view/screen/offers.dart';
import 'package:bloomy/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {

changepage(int currentpage);


}


class HomescreencontrollerImp extends HomeScreenController {
  int currentpage = 0 ; 
  List <Widget> listPage = [
    Home() , 
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("setting") )]
    // ),
    NotificationsView() , 
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("offers"))]
    // ),
    Settings() ,
   
    OffersView() ,     
  ];
  List bottomappbar = [
   {"title" : "home" , 
   "icon" : Icons.home ,
   } ,
    {"title" : "notifications" , 
   "icon" : Icons.notifications_active_rounded ,
   } ,
    {"title" : "settings" , 
   "icon" :   Icons.settings ,
   } ,
    {"title" :  "offers"  , 
   "icon" :  Icons.local_offer_rounded,
  
   } ,
  ] ;
  @override
  changepage(int i) {
    currentpage= i ;
    update();

  }
}