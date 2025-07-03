

import 'package:bloomy/controller/homescreencontroller.dart';
import 'package:bloomy/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomescreencontrollerImp());
    return GetBuilder<HomescreencontrollerImp>(builder: 
    (controller)=> Scaffold(floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 223, 170, 188),
        onPressed: (){} , child: Icon(Icons.shopping_basket_outlined
      ),
      ),
      bottomNavigationBar: BottomAppBar(
       
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Row(
          children: [
            Row(
              children: [
                CustomBottomAppBar("Home", Icons.home, (){controller.changepage(0) ;}, Colors.amberAccent) ,
                 CustomBottomAppBar("settings", Icons.settings, (){controller.changepage(1) ;}, Colors.amberAccent) ,
          
              ],
            ),
            Spacer() , 
              Row(
              children: [
               CustomBottomAppBar("profile" ,Icons.power_off_outlined , (){
                controller.changepage(2) ;
               } ,  Colors.amberAccent ) ,
             CustomBottomAppBar("favourite", Icons.favorite_outline_outlined, (){
controller.changepage(3) ;

             } ,  Colors.amberAccent)
              ],
            ),
          ],
        ),
      ),
      body: controller.listPage.elementAt(controller.currentpage)
    ));
  }
}