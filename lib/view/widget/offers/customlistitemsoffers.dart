import 'package:bloomy/controller/favoritecontroller.dart';
import 'package:bloomy/controller/offers_controller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/appimages.dart';
import 'package:bloomy/core/functions/translatedatabase.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:bloomy/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  final String heroTag;

  const CustomListItemsOffers({
    super.key,
    required this.itemsModel,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // مهم جداً
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ✅ صورة المنتج + أيقونة Sale
              SizedBox(
                 width: double.infinity,
                height: 400, 
               // تحديد ارتفاع ثابت للصورة
                child: Hero(
                  tag: heroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                             
                            imageUrl:
                                "${linkApi.linkitemsimages}/${itemsModel.itemsImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (itemsModel.itemsDiscount != null &&
                            itemsModel.itemsDiscount! > 0)
                            Positioned(
  top: 8,
  left: 8,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(50), // 🔸 يجعلها دائرية
    child: Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.0), // خلفية شفافة
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Image.asset(
        AppImage.sale,
        fit: BoxFit.fill, // ✅ يحافظ على الكلمة "SALE" كاملة
      ),
    ),
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
                  // Text(
                  //   "Rating 3.5",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontFamily: 'cairo',
                  //     color: AppColor.greytwo,
                  //   ),
                  // ),
                  // Row(
                  //   children: List.generate(
                  //     5,
                  //     (i) => const Icon(Icons.star, size: 15),
                  //   ),
                  // ),
                  
                ],
              ),

              const SizedBox(height: 10),

              // السعر والمفضلة
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

