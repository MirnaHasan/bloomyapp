

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomSigninSignUp extends StatelessWidget {
  const CustomSigninSignUp({super.key, required this.title, required this.imageUrl});
final String title ;
final String imageUrl ;
  @override
  Widget build(BuildContext context) {
    return  Column(children: [ Text(title,
             
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                color: AppColor.green,
              ),
            ),
            SizedBox(height: 30),
            Image.asset(imageUrl, height: 500, width: 500),
            SizedBox(height: 80),],);
  }
}