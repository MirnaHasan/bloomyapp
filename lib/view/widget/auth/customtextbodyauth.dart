

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomTextBody extends StatelessWidget {
  const CustomTextBody({super.key, required this.text});
final String text ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ,
       textAlign: TextAlign.center ,
        
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.normal,
            color: const Color.fromARGB(179, 39, 39, 39)),);
  }
}