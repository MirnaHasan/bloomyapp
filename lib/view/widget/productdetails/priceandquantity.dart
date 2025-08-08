

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:flutter/material.dart';

class PriceAndQuantityItems extends StatelessWidget {
  final void Function()? onAdd ;
  final void Function()? onRemove ;
  final String price ; 
    final String count ; 

  const PriceAndQuantityItems({super.key,required this.onAdd,required this.onRemove, required this.price, required this.count});

  @override
  Widget build(BuildContext context) {
    return  Row(
                      
                        children: [
                          Row(children: [  
                          IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black
                              ),
                            ),
                            child: Text( 
                              "$count" , style: TextStyle(fontSize: 20,height: 1.1),),),
                            IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),],) ,
                       Spacer(),

                          Text(
                            " $price\$",
                            style: TextStyle(
                              height: 1.1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
          

                        ],
                      );
  }
}