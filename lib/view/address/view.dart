

import 'package:bloomy/controller/address/viewaddresscontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:bloomy/core/constant/appcolor.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("📍 عناويني"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GetBuilder<ViewAddressController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                 
                  return AddressCard(address: controller.data[index] ,  onDelete: () { 
                    controller.deleteaddress(controller.data[index].addressId.toString()) ;

                   },) ;
                  
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressModel address ; 
  final Function()? onDelete ; 
  const AddressCard({super.key ,required this.address, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red.shade100,
                        child: const Icon(Icons.location_on,
                            color: AppColor.green, size: 28),
                      ),
                      title: Text(
                        address.addressName ?? "بدون اسم",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            address.addressCity ?? "",
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            address.addressStreet ?? "",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.delete_outline,
                          color: Colors.grey),
                      onTap: onDelete
                        // مستقبلًا ممكن تفتح صف
                    ),
                  );
  }
}