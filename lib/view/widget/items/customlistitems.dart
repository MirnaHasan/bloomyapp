import 'package:bloomy/controller/favoritecontroller.dart';
import 'package:bloomy/controller/itemscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:bloomy/core/functions/translatedatabase.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:bloomy/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomListItems extends GetView<ItemscontrollerImp> {
  final ItemsModel itemsModel;
  final String heroTag;

  const CustomListItems({
    super.key,
    required this.itemsModel,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel, heroTag);
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
              // ✅ صورة المنتج + أيقونة Sale
              Expanded(
                child: Hero(
                  tag: heroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        // صورة المنتج
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl:
                                "${linkApi.linkimages}/${itemsModel.itemsImage}",
                            fit: BoxFit.cover,
                          ),
                        ),

                        // أيقونة Sale (تظهر فقط عند وجود خصم)
                        if (itemsModel.itemsDiscount != null &&
                            itemsModel.itemsDiscount! > 0)
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Image.asset(
                              AppImage.sale,
                              width: 45,
                              height: 45,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // اسم المنتج
              Text(
                translatFromDataBase(
                    itemsModel.itemsNameAr, itemsModel.itemsName),
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 5),

              // التقييم
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rating 3.5",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'cairo',
                      color: AppColor.greytwo,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (i) => const Icon(Icons.star, size: 15),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ✅ السعر والمفضلة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemspricediscount}\$",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.green,
                      fontFamily: 'sans',
                    ),
                  ),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        final id = itemsModel.itemsId;
                        final currentVal = controller.isFavorite[id];

                        if (currentVal == "1") {
                          controller.setFavorite(id, "0");
                          controller.removeFavoritefromdata(
                              itemsModel.itemsId.toString());
                        } else {
                          controller.setFavorite(id, "1");
                          controller.addFavoritefromdata(
                              itemsModel.itemsId.toString());
                        }
                      },
                      icon: Icon(
                        controller.isFavorite[itemsModel.itemsId] == "1"
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: AppColor.green,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
