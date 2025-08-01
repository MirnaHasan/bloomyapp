

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';



class CustomBottomAppBar extends StatelessWidget {
  final String textbutton;
  final IconData iconData;
  final void Function()? onPressed;
  final bool active;
  const CustomBottomAppBar({
    required  this.textbutton,
   required this.iconData,
    required this.onPressed,
   required this.active, 
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
          // Text(
          //   textbutton,
          //   style: TextStyle(
          //     fontSize: 15,
             
          //     color: active == true ? AppColor.green:AppColor.greytwo) ,
          //   ),
          
        ],
      ),
    );
  }
}
