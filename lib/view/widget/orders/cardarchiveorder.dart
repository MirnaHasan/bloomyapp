

import 'package:bloomy/controller/orders/orderarchivecontroller.dart';
import 'package:bloomy/controller/orders/pendingorderscontroller.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/data/model/ordermodel.dart';
import 'package:bloomy/data/model/pendingorders.dart';
import 'package:bloomy/view/widget/orders/ordersrating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jiffy/jiffy.dart';

class CardArchiveOrder extends GetView <OrdersArchiveController> {
  final OrdersModel pendingordermodel ; 
  CardArchiveOrder({super.key, required this.pendingordermodel});

  @override
  Widget build(BuildContext context) {
    return  Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.white, Color(0xFFE8F5E9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.confirmation_number, color:  Colors.green.shade700, ),
                        const SizedBox(width: 8),
                        Text(
                          "Order Number: ${pendingordermodel.ordersId}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:  Colors.green.shade700,
                          ),
                        ),
                        Spacer(), 
                     
                        Text("${Jiffy.parse(pendingordermodel.ordersDatetime!).fromNow() }",  style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:  Colors.green.shade700,
                          ),)

                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.greenAccent),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.delivery_dining, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                         Text("Order Type: ${controller.printOrderType(pendingordermodel.ordersType.toString())}"),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.local_offer, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                         Text("Order Price: ${pendingordermodel.ordersPrice}\$"),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.local_shipping, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                      Text("Delivery Price: ${pendingordermodel.ordersPricedelivery}\$"),
                      ],
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet,
                            color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Text("Payment Method: ${controller.printpaymentMethode(pendingordermodel.ordersPaymentmethod.toString())}")

                      ],
                    ),
                       const SizedBox(height: 6),
                   Row(
                      children: [
                        Icon(Icons.mode_comment_sharp,
                            color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Text("Order Status: ${controller.printOrderStatus(pendingordermodel.ordersStatus.toString())}"),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.greenAccent),
                    const SizedBox(height: 6),
Row(
  children: [
    // النص يأخذ مساحة مرنة ويُقلّص عند الحاجة
    Expanded(
      child: Text(
        "Total Price: ${pendingordermodel.ordersTotalprice}\$",
        style: TextStyle(
          fontSize: 16,
          color: Colors.green.shade700,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis, // يمنع تجاوز النص
      ),
    ),

    // زر تفاصيل الطلب (تم تصغيره)
    ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        minimumSize: const Size(90, 36), // عرض وارتفاع الزر
      ),
      onPressed: () {
        Get.toNamed(
          AppRoutes.detailsorders,
          arguments: {"orderdetails": pendingordermodel},
        );
      },
      icon: const Icon(Icons.info_outline, color: Colors.white, size: 16),
      label: const Text(
        "Details",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    ),

    const SizedBox(width: 6),
    if (pendingordermodel.ordersRating == "0") 
     ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        minimumSize: const Size(90, 36), // عرض وارتفاع الزر
      ),
      onPressed: () {
        showDialogRating(context , pendingordermodel.ordersId.toString()) ; 
      },
      icon: const Icon(Icons.info_outline, color: Colors.white, size: 16),
      label: const Text(
        "Rating",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    ),


   
  ],
)

                  ],
                ),
              ),
            );
  }
}