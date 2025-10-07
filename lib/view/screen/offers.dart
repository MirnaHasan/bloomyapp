import 'package:bloomy/controller/favoritecontroller.dart';
import 'package:bloomy/controller/offers_controller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/data/model/items.dart';

import 'package:bloomy/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ ربط الكنترولرز
    Get.put(OffersController());
    Get.put(FavoriteController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8F3),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: const Text(
          "العروض 🌿",
          style: TextStyle(
            fontFamily: 'cairo',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 3,
      ),

      // ✅ الجسم الرئيسي
      body: GetBuilder<OffersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: RefreshIndicator(
            color: Colors.green.shade700,
            onRefresh: () async {
              await controller.refreshOffers();
            },
            child: controller.data.isEmpty
                ? Center(
                    child: Text(
                      "لا توجد منتجات عليها عروض حالياً 🌱",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                        fontFamily: 'cairo',
                      ),
                    ),
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.data.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      ItemsModel item = controller.data[index];
                      return CustomListItemsOffers(
                        itemsModel: item,
                        heroTag: "offer_${item.itemsId}_$index",
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

