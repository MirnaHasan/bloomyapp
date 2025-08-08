

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:flutter/material.dart';

class CustomItemsCardList extends StatelessWidget {
  const CustomItemsCardList({super.key, required this.name, required this.price, required this.count});
  final String name ; 
  final String price ; 
  final String count ; 

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(AppImage.logoImage, fit: BoxFit.cover),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(
                  price,
                  style: TextStyle(fontSize: 18, color: AppColor.green),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                  ),
                  Container(
                    height: 30,
                    child: Text(count, style: TextStyle(fontFamily: 'sans')),
                  ),
                  Container(
                    height: 25,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
