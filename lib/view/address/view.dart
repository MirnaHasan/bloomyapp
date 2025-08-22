

import 'package:bloomy/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoutes.addressAdd) ;
      } , 
      child: Icon(Icons.add),),
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: ListView(
        children: [
          

        ],
      ),
    );
  }
}