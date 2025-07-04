import 'package:bloomy/controller/itemscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/linkapi.dart';
import 'package:bloomy/view/widget/customappbar.dart';
import 'package:bloomy/view/widget/items/listcategoriesitems.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemscontrollerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              titleAppBar: "Find Products",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            SizedBox(height: 20),
            ListCategoriesItems(),
            SizedBox(
              child: GridView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6, // أقل لتوسيع الارتفاع (الصورة تأخذ مساحة أكبر)
                ),
                itemBuilder: (BuildContext context, int i) {
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // ✅ Expanded للصورة
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: "${linkApi.linkimages}/Gardenia.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Name of flowers",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Descriptions of flowers",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'cairo',
                                color: AppColor.greytwo,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            // ✅ السعر والمفضلة
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "200.10\$",
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
