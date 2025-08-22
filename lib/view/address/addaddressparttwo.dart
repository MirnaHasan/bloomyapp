


import 'package:bloomy/controller/address/addaddressparttwocontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AddressAddPartTwo extends StatelessWidget {
  const AddressAddPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
  
      AddAddressPartTwoController controllerpage = Get.put(AddAddressPartTwoController()) ;
    return Scaffold(
 
      appBar: AppBar(
        title: Text("Add details Address"),
      ),
      body: GetBuilder<AddAddressPartTwoController>(builder: (controllerpage)=>
       HandlingDataView(statusRequest: controllerpage.statusRequest,
        widget: Column(
        children: [
        
        ],
      ),))
    );
  }
}