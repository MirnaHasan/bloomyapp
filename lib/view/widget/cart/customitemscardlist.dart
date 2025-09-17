

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/linkapi.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomItemsCardList extends StatelessWidget {
  const CustomItemsCardList({super.key, required this.name, 
  required this.price, 
  required this.count, 
  required this.imageName, 
 required this.onAdd, 
 required this.onRemove});
  final String name ; 
  final String price ; 
  final String count ;
  final String imageName ; 
  final  void Function()? onAdd ; 
  final  void Function()? onRemove ; 


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
           
                child: CachedNetworkImage(
              
                //  fit: BoxFit.cover,
                  imageUrl: "${linkApi.linkimages}/$imageName"
                  ,height: 100,),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: TextStyle(fontSize: 15)),
                // subtitle: Text(
                //   price,
                //   style: TextStyle(fontSize: 18, color: AppColor.green),
                // ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    child: IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                  ),
                  Container(
                    height: 30,
                    child: Text(count, style: TextStyle(fontFamily: 'sans')),
                  ),
                  Container(
                    height: 25,
                    child: IconButton(
                      onPressed: onRemove,
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
