



// ignore_for_file: strict_top_level_inference, avoid_print

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/orders/archiveorder_data.dart';
import 'package:bloomy/data/datasourse/remote/orders/pending_orders_data.dart';
import 'package:bloomy/data/model/pendingorders.dart';
import 'package:get/get.dart';
class OrdersArchiveController extends GetxController {
  MyServices myServices = Get.find();
  OrderArchiveData ordersarchiveData =  OrderArchiveData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  List<PendingOrdersModel> data = [];
  late PendingOrdersModel ordermodel;

  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Drive Thru";
    }
  }

  String printpaymentMethode(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order Is Prepared";
    } else if (val == "2") {
      return "Ready To Picked Up By Delivery Man";
    }else if (val == "3") {
      return "On The Way";
    }  
    else {
      return "Archive";
    }
  }

  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await ordersarchiveData.getData(
        myServices.sharedPreferences.getInt("id").toString());

    print("==================pendingorderscontroller==============================");
    print("RAW RESPONSE => $response");

    statusRequest = await handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // ✅ هنا التعديل
        List<Map<String, dynamic>> listdata =
            List<Map<String, dynamic>>.from(response['data']);

        print("Orders Count = ${listdata.length}");
        if (listdata.isNotEmpty) {
          print("First Order = ${listdata[0]}");
        }

        data.addAll(listdata.map((e) => PendingOrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    await Future.delayed(const Duration(milliseconds: 500));
    update();
  }

  
  refreshorder() {
    getItems();
  }

  goToDetailsOrder() {
    Get.toNamed(AppRoutes.detailsorders,
        arguments: {"orderdetails": ordermodel});
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
  }
}