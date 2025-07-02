

import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeComtrollerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                      height: 200,
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(width: 19),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.items.length,
                        itemBuilder: (context, i) {
                          return ItemsHome(itemsModel: ItemsModel.fromJson(controller.items[i]));
                        },
                      ),
                    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 180,
          width: 160,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
            height: 180,
            width: 160,
            "${linkApi.linkimages}/${itemsModel.itemsImage}",
            fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            height: 180,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 30,

          child: Text(
            "${itemsModel.itemsName}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 254, 254),
            ),
          ),
        ),
      ],
    );
  }
}
