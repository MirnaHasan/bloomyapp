

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/orders_data.dart';
import 'package:bloomy/data/model/pendingorders.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController {
   MyServices myServices = Get.find();
  PendingOrdersData pendingordersData = PendingOrdersData(Get.find());
StatusRequest statusRequest = StatusRequest.none;
List<PendingOrdersModel> data = [] ; 
  
  getItems(categoryid) async {
    data.clear() ;
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await pendingordersData.getData(  myServices.sharedPreferences.getInt("id").toString());
    print("==================pendingorderscontroller==============================") ; 

        print("========================{$response}===============================");
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'] ;
        data.addAll(listdata.map((e)=> PendingOrdersModel.fromJson(e) )) ;  

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    await Future.delayed(const Duration(milliseconds: 500));
    update();
  }

}