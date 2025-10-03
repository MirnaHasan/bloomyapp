import 'package:bloomy/controller/orders/detailscontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';


class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: 
      AppBar(
        // elevation: 0,
        // backgroundColor: Colors.green.shade700,
        title: const Text(
          "Order Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<OrdersDetailsController>(
          
          builder: (controller)=>
          HandlingDataView(statusRequest: controller.statusRequest,
           widget:  ListView(
          children: [
            // عنوان المنتجات
            const Text(
              "Items",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),

            // جدول المنتجات داخل Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Column(
                children: [
                  // الهيدر
                  Container(
                    
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text("Item",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: Text("Quantity",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: Text("Price",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 0),

                  // صف 1
                  // Container(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 12, horizontal: 16),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //           child: Text("Gardenia",
                  //               textAlign: TextAlign.center)),
                  //       Expanded(
                  //           child: Text("3", textAlign: TextAlign.center)),
                  //       Expanded(
                  //           child: Text("\$2000",
                  //               textAlign: TextAlign.center)),
                  //     ],
                  //   ),
                  // ),
                  ...List.generate(controller.data.length,
                  (index)=>   Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text("${controller.data[index].itemsNameAr}",
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("${controller.data[index].itemsCount}", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("${controller.data[index].itemsPrice}\$",
                                textAlign: TextAlign.center)),
                      ],
                    ),
                  ), ) ,
                  const Divider(height: 0),

                  // صف 2
               
                ],
              ),
            ),

            const SizedBox(height: 20),

            // السعر الكلي
            Card(
              color: Colors.green.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      "Total Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "${controller.ordermodel!.ordersTotalprice}\$",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // عنوان الشحن
            if (controller.ordermodel!.ordersType.toString() == "0")
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: ListTile(
                leading: Icon(LucideIcons.mapPin, color: Colors.green.shade700),
                title:  Text(
                  "Shipping Address",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${controller.ordermodel!.addressCity} ${controller.ordermodel!.addressStreet}")
              ),
            ),
            SizedBox(height: 20,) , 
          // الخريطة
 if (controller.ordermodel!.ordersType.toString() == "0")
Card(
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
    height: 300,
    width: double.infinity,
    child: controller.cameraPosition == null
        ? const Center(child: CircularProgressIndicator())
        : ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: GoogleMap(
              mapType: MapType.normal,
              markers: controller.markers.toSet(),
              initialCameraPosition: controller.cameraPosition!,
              onMapCreated: (GoogleMapController controllermap) {
                controller.controllercompleter.complete(controllermap);
              },
            ),
          ),
  ),
),

          ],
        ),)
        )
      ),
    );
  }
}
