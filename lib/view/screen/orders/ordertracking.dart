



import 'package:bloomy/controller/orders/trackingcontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart' show AppColor;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TrackingController());

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          "Order Tracking",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<TrackingController>(
          assignId: false,
          builder: (_) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Column(
                children: [
                  if (controller.ordersModel.ordersType == 0)
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,

                          // ❗ لا تمرر markers مباشرة لأن هذا يعيد بناء الخريطة
                          // نستخدم FutureBuilder صغير
                          markers: Set.from(controller.markers),

                          // ❗ نفس الشيء للبوليلين
                          polylines: Set.from(controller.polylineSet),

                          initialCameraPosition: controller.cameraPosition!,

                          onMapCreated: (GoogleMapController controllermap) {
                            controller.gmc = controllermap;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20,) ,
                
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
