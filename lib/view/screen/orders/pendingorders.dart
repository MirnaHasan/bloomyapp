
import 'package:bloomy/controller/orders/pendingorderscontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/data/model/pendingorders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  PendingOrders({super.key});

  final PendingOrdersController controller = Get.put(PendingOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.green,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.local_florist, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Pending Orders",
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
        child: GetBuilder<PendingOrdersController>(builder: (controller) =>
        HandlingDataView(statusRequest: controller.statusRequest, widget:   ListView.builder(
          itemCount: controller.data.length,
          itemBuilder:(context , index) =>
         CardPendingOrder(pendingordermodel: controller.data[index],)
          ),)
       
      ),
    )) ;
  }
}


class CardPendingOrder extends GetView <PendingOrdersController> {
  final PendingOrdersModel pendingordermodel ; 
  CardPendingOrder({super.key, required this.pendingordermodel});

  @override
  Widget build(BuildContext context) {
    return     Card(
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
                        Icon(Icons.confirmation_number, color: AppColor.green),
                        const SizedBox(width: 8),
                        Text(
                          "Order Number: ${pendingordermodel.ordersId}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.green,
                          ),
                        ),
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
                        Text("Payment Method: ${controller.printpaymentMethode(pendingordermodel.ordersPricedelivery.toString())}"),
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
                        Text(
                          "Total Price: ${pendingordermodel.ordersTotalprice}\$",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // تنقل لصفحة تفاصيل الطلب
                          },
                          icon: const Icon(Icons.info_outline,
                              color: Colors.white),
                          label: const Text(
                            "Order Details",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}