

import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(AppImageAsset.logoImage , width: 250,
          height: 250,);
  }
}