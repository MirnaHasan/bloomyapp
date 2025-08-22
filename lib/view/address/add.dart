

import 'package:bloomy/controller/address/addaddress_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
  
    AddAddressController controllerpage = Get.put(AddAddressController()) ;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      } , 
      child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("Add New Address"),
      ),
      body: GetBuilder<AddAddressController>(builder: (controllerpage)=>
       HandlingDataView(statusRequest: controllerpage.statusRequest,
        widget: Column(
        children: [
          // ignore: unnecessary_null_comparison
          if (controllerpage.kGooglePlex != null) 
       Expanded(
         child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: controllerpage.kGooglePlex!,
          onMapCreated: (GoogleMapController controllermap) {
            controllerpage.controllercompleter!.complete(controllermap);
          },
               ),
       ),
        ],
      ),))
    );
  }
}