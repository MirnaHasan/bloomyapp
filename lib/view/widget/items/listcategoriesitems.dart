


import 'package:bloomy/controller/itemscontroller.dart';

import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/functions/translatedatabase.dart';
import 'package:bloomy/data/model/categories.dart';

import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemscontrollerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 60,
      width: 160,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 40),

        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          print(
            "${linkApi.linkcategoriesimages}/${controller.categories[index]['categories_image']}",
          );
        

          return Categories(
            i : index , 
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}


class Categories extends GetView<ItemscontrollerImp> {
 final CategoriesModel categoriesModel ;
 final int?  i ; 
  const Categories({super.key, required this.categoriesModel , required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.chaneCategory(i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     color: AppColor.greenAccent,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
      
                //   width: 160,
                //   height: 160,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(20),
      
                //     child: Image.network(
                //       width: 160,
                //       height: 160,
      
                //       "${linkApi.linkimages}/${categoriesModel.categoriesImage}",
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
            GetBuilder<ItemscontrollerImp>(builder: (controller)=>Container( 
            
                  padding: EdgeInsets.only(left: 10, right: 10 , bottom: 5),
                  decoration: 
                  controller.selectedCategory == i! ?
                  BoxDecoration(
                  
                    border: Border(bottom: BorderSide(width: 3 , color: AppColor.green , ))
                  ): null , 
                  child: Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: AppColor.greytwo , ),
                        
                  translatFromDataBase(categoriesModel.categoriesNameAr , categoriesModel.categoriesName)
                  ), 
                ) ,) 
               
              ],
            ),
    );
  }
}