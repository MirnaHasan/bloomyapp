

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';



class CustomBottomAppBar extends StatelessWidget {
  final String textbutton;
  final IconData iconData;
  final void Function()? onPressed;
  final bool active;
  const CustomBottomAppBar(
    this.textbutton,
    this.iconData,
    this.onPressed,
    this.active, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: active == true ? AppColor.green:AppColor.greytwo) ,
          Text(
            textbutton,
            style: TextStyle(
              fontSize: 15,
              // fontWeight: FontWeight.bold,
              color: active == true ? AppColor.green:AppColor.greytwo) ,
            ),
          
        ],
      ),
    );
  }
}
