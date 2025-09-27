


import 'package:bloomy/controller/address/adddetailsaddress_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/shared/custombuttondefault.dart';
import 'package:bloomy/view/widget/auth/custommaterialbottonauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AddDetailsAddress extends StatelessWidget {
  const AddDetailsAddress({super.key});

  @override
  Widget build(BuildContext context) {
  
     AddDetailsaAddressController controller = Get.put(  AddDetailsaAddressController()) ;
    return Scaffold(
 
      appBar: AppBar(
        title: Text("Add details Address"),
      ),
      body:  Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<AddDetailsaAddressController>(
          builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest ,
           widget: ListView(
          children: [
            CustomMaterialButtonAuth(
              labelText: "City",
               hintText: "Enter The City",
                icon: Icon(Icons.location_city_rounded),
                 myController:controller.city! ,
                  valid:(Val){} ,
                   isNumber: false) ,
                   SizedBox(height: 20,), 
                   CustomMaterialButtonAuth(
              labelText: "Street",
               hintText: "Enter The Street",
                icon: Icon(Icons.streetview_rounded),
                 myController:controller.street! ,
                  valid:(Val){} ,
                   isNumber: false) ,
                   SizedBox(height: 20,) , 
                   CustomMaterialButtonAuth(
              labelText: "Name",
               hintText: "Enter The Name",
                icon: Icon(Icons.near_me),
                 myController:controller.name! ,
                  valid:(Val){} ,
                   isNumber: false) ,
                   SizedBox(height: 50,) , 
                   CustomButtonDefault(textbutton: "Save The Address", onPressed:(){
                    controller.addDetailsAddress() ; 
                   }) ,

          ],
        ),))
      )
    );
  }
}