
import 'package:bloomy/controller/itemscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/functions/translatedatabase.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:bloomy/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemscontrollerImp>  {
  final ItemsModel itemsModel ;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
                    onTap: () {
                      controller.goToProductDetails(itemsModel);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // ✅ Expanded للصورة
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: linkApi.linkimages +"/"+ "${itemsModel.itemsImage}" ,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                             translatFromDataBase(itemsModel.itemsNameAr, itemsModel.itemsName) ,
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Rating 3.5", textAlign: TextAlign.center,style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'cairo',
                                color: AppColor.greytwo,
                     ),),
                     Row(children: [
                     ... List.generate(5, (i)=> Icon(Icons.star , size: 15,)) 
                     ],)
                              ],
                            ),
                            // Text(
                            //    "${itemsModel.itemsDesc}" ,
                            //   style: TextStyle(
                            //     fontSize: 14,
                            //     fontFamily: 'cairo',
                            //     color: AppColor.greytwo,
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),
                            SizedBox(height: 10),
                            // ✅ السعر والمفضلة
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${itemsModel.itemsPrice}\$",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.green,
                                    fontFamily: 'sans',
                                  ),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: AppColor.green,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                
              
            
  }
}