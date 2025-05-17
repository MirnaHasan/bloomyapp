
import 'package:flutter/material.dart';

class CustomMaterialButtonAuth extends StatelessWidget {
  const CustomMaterialButtonAuth({
  super.key, 
  required this.labelText,
   required this.hintText,
   required this.icon, 
   required this.myController,
   required this.valid,
    required this.isNumber,
    this.obscureText,
     this.onTapIcon });
 final String labelText ;
 final String hintText ;
 final Icon icon ;
 final TextEditingController myController ;
 final String? Function(String?)? valid ;
final bool isNumber ;
final bool?  obscureText ;
final void Function()? onTapIcon ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null || obscureText == false ? false : true,
      keyboardType: isNumber? TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
      validator: valid,
           controller: myController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: InkWell(
                  onTap: onTapIcon,
                  child: icon),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)),
            label: Container(
              padding: EdgeInsets.only(left: 6),
              child: Text(labelText)),
            hintText: hintText
          ),) ;
  }
}