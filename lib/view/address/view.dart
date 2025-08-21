

import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){} , 
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