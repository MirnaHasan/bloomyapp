

import 'package:bloomy/view/screen/home.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {

changepage(int currentpage);


}


class HomescreencontrollerImp extends HomeScreenController {
  int currentpage = 0 ; 
  List <Widget> listPage = [
    Home() , 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("setting") )]
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("profile"))]
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("favourite"))],
    ),     
  ];
  List titleBottomAppBar = [
    "Home" , 
    "Settings" , 
    "Profile" , 
    "favourite"
  ] ;
  @override
  changepage(int i) {
    currentpage= i ;
    update();

  }
}