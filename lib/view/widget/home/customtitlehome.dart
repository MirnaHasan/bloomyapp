
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomTitleHome extends StatelessWidget {
  final String title;
  const CustomTitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart, // ⬅️ يلتصق يسار بالإنجليزي ويمين بالعربي
      child: Text(
        title,
        textAlign: TextAlign.start, // ⬅️ مهم حتى النص يتبع الاتجاه
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.green,
        ),
      ),
    );
  }
}