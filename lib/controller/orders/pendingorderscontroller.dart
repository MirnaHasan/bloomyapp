

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
String printOrderType(String val ){
  if (val == "0"){
    return "Delivery" ; 
  }else{
    return "Dreive Thru" ; 
  }
} 

String printpaymentMethode(String val){
  if (val == "0"){
    return "Cash On Delivery" ; 
  }else{
    return "Payment Card" ; 
  }
}

String printOrderStatus(String val){
  if (val == "0"){
    return "Pending Approval" ;
  }
  else if (val == "1"){
    return "The Order Is Prepared" ; 
  }
    else if (val == "2"){
      return "On The Way" ; 
    }
    else{
      return "Archive" ; 
    }
}
  
  getItems() async {
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
  refreshorder(){
    getItems() ;
  }
  @override
  void onInit() {
    // TODO: implement onInit
     getItems() ;
    super.onInit();
  }

}