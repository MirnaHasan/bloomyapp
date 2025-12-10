

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/orders/pending_orders_data.dart';
import 'package:bloomy/data/model/ordermodel.dart';

import 'package:get/get.dart';
class PendingOrdersController extends GetxController {
  MyServices myServices = Get.find();
  PendingOrdersData pendingordersData = PendingOrdersData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  late OrdersModel ordermodel;

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
  goToPageTracking(OrdersModel ordermodel){
      Get.toNamed(AppRoutes.trackingorder , 
       arguments: {"orderdetails": ordermodel},) ;
  }

  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await pendingordersData.getData(
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

        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    await Future.delayed(const Duration(milliseconds: 500));
    update();
  }

  deleteItems(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await pendingordersData.deleteData(orderid);

    print("==================Deleteorderscontroller==============================");
    print("RAW RESPONSE => $response");

    statusRequest = await handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      refreshorder() ;
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
