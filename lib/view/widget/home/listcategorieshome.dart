import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/data/model/categories.dart';

import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeComtrollerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: 170,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 40),

        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          print(
            "${linkApi.linkimages}/${controller.categories[index]['categories_image']}",
          );

          return Categories(categoriesModel: CategoriesModel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}


class Categories extends StatelessWidget {
 final CategoriesModel categoriesModel ;
  const Categories({super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                ),

                width: 160,
                height: 160,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),

                  child: Image.network(
                    width: 160,
                    height: 160,

                    "${linkApi.linkimages}/${categoriesModel.categoriesImage}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: AppColor.green),

                "${categoriesModel.categoriesName}",
              ),
            ],
          );
  }
}