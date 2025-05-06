import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class CustomLanguage extends StatelessWidget {
  const CustomLanguage({
    super.key,
    required this.text,
    required this.textButtononelang,
    required this.onPressedOne,
    required this.onPressedTwo,
    required this.textButtontwolang,
  });
  final String text;
  final String textButtononelang;
  final String textButtontwolang;
  final void Function()? onPressedOne;
  final void Function()? onPressedTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 40),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          width: double.infinity,
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColor.primaryColor,
            onPressed: onPressedOne,
            child: Text(
              textButtononelang,

              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          width: double.infinity,
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColor.primaryColor,
            onPressed: onPressedTwo,
            child: Text(
              textButtontwolang,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
