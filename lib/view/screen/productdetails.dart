import 'package:bloomy/controller/productdetailscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/functions/translatedatabase.dart';
import 'package:bloomy/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // خلفية علوية
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: AppColor.greenAccent,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),

              // صورة المنتج
              Positioned(
                 top: 80,
                left: Get.width * 0.05,
                right: Get.width * 0.05,
                child: Hero(
                  tag: "${controller.itemsModel.itemsId}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                       topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Image.network(
                      "${linkApi.linkimages}/${controller.itemsModel.itemsImage}",
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // بطاقة التفاصيل
              Positioned(
                top: 520,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       translatFromDataBase("${controller.itemsModel.itemsNameAr}","${controller.itemsModel.itemsName}"),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        translatFromDataBase("${controller.itemsModel.itemsDescAr}","${controller.itemsModel.itemsDesc}"),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.itemsModel.itemsPrice} \$",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        MaterialButton(
  color: AppColor.greenAccent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  ),
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  onPressed: () {
    // action here
  },
  child: Text(
    "أضف إلى السلة",
    style: TextStyle(color: Colors.white),
  ),
),

                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100), // لتجنب التداخل عند الأسفل
        ],
      ),
    );
  }
}
