

import 'package:bloomy/controller/homescreencontroller.dart';
import 'package:bloomy/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller)=> BottomAppBar(
       
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ... List.generate(controller.listPage.length +1,
             (index) {
              int i = index> 2 ? index-1 : index ; 
              return  index == 2 ? Spacer() : 
              CustomBottomAppBar( controller.titleBottomAppBar[i], 
              Icons.home, (){controller.changepage(i);},
             controller.currentpage == i ? true : false ) ;
             }
             )
    
          ],
        ),
      ));
  }
}