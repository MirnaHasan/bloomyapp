
import 'package:flutter/material.dart';

class CustomMaterialButtonAuth extends StatelessWidget {
  const CustomMaterialButtonAuth({super.key, required this.labelText, required this.hintText,
   required this.icon, required this.myController});
 final String labelText ;
 final String hintText ;
 final Icon icon ;
 final TextEditingController myController ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
           controller: myController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
            label: Container(
              padding: EdgeInsets.only(left: 6),
              child: Text(labelText)),
            hintText: hintText
          ),) ;
  }
}