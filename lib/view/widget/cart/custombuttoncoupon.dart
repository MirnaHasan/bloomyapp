

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  const CustomButtonCoupon({
    super.key,

    required this.textButton,
    required this.onPressed,
  });

  final String textButton;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return
        Container(
          //  padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 12),
            color: AppColor.greenAccent,
            onPressed: onPressed,
            child: Text(
              textButton,

              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white , 
              
              fontWeight: FontWeight.normal),
            ),
          ),
        
        
    );
  }
}