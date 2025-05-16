
import 'package:flutter/material.dart';

class CustomMaterialButtonAuth extends StatelessWidget {
  const CustomMaterialButtonAuth({super.key, required this.labelText, required this.hintText,
   required this.icon, required this.myController,required this.valid, required this.isNumber});
 final String labelText ;
 final String hintText ;
 final Icon icon ;
 final TextEditingController myController ;
 final String? Function(String?)? valid ;
  final bool isNumber ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber? TextInputType.number : TextInputType.text,
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