


import 'package:bloomy/controller/orders/orderarchivecontroller.dart';

import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/view/widget/orders/cardarchiveorder.dart';


import 'package:bloomy/view/widget/orders/cardpendingorderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ArchiveOrdersView extends StatelessWidget {
  ArchiveOrdersView({super.key});

   OrdersArchiveController controller = Get.put(OrdersArchiveController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F6),
      appBar: AppBar(
    
       
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Archive Orders",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<OrdersArchiveController>(builder: (controller) =>
        HandlingDataView(statusRequest: controller.statusRequest, widget:   ListView.builder(
          itemCount: controller.data.length,
          itemBuilder:(context , index) =>
         CardArchiveOrder(pendingordermodel: controller.data[index],)
          ),)
       
      ),
    )) ;
  }
}