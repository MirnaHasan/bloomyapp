


import 'package:flutter/material.dart';

class CustomTextAuth extends StatelessWidget {
   CustomTextAuth({super.key, required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return   Text( title,
      textAlign: TextAlign.center ,
       
       
        style: Theme.of(context).textTheme.titleLarge);
  }
}