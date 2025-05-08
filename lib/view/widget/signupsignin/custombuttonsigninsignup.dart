

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomMaterialSigninUp extends StatelessWidget {
  const CustomMaterialSigninUp({
    super.key,
    required this.textbutton,
    required this.onPressed,
  
  });
  final String textbutton;


  final void Function()? onPressed;
 
  @override
  Widget build(BuildContext context) {
    return
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          color: AppColor.green,
          onPressed: onPressed,
          child: Text(
            textbutton,
            style: Theme.of(context).textTheme.bodySmall,
          ),
       
    );
  }
}
