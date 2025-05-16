
import 'package:flutter/material.dart';

class CustomMaterialButtonAuth extends StatelessWidget {
  const CustomMaterialButtonAuth({super.key, required this.labelText, required this.hintText,
   required this.icon, required this.myController,required this.valid});
 final String labelText ;
 final String hintText ;
 final Icon icon ;
 final TextEditingController myController ;
 final String? Function(String?)? valid ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
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