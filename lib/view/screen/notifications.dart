
import 'package:bloomy/controller/notificationscontroller.dart';
import 'package:bloomy/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';



// استبدل بالمسار الصحيح

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationsController controller = Get.put(NotificationsController());

 

    return Scaffold(
      appBar: AppBar(
        title: const Text("الإشعارات"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<NotificationsController>(
        builder: (controller) {
          if (controller.data.isEmpty) {
            return const Center(
              child: Text(
                "لا توجد إشعارات حالياً 🌱",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return HandlingDataView(statusRequest: controller.statusRequest,
           widget: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.data.length,
            itemBuilder: (context, i) {
              final item = controller.data[i];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: const Icon(Icons.notifications, color: Colors.green),
                  ),
                  title: Text(
                    item["notification_title"] ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(
                    item["notification_body"] ?? "",
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  trailing: Text("${Jiffy.parse(item["notification_datetime"]).fromNow() }"
                  , 
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12), 
                  ),
                ),
              );
            },
          )) ;
        },
      ),
    );
  }
}
