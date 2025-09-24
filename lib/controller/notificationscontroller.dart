

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/notifications_data.dart';
import 'package:get/get.dart';


class NotificationsController extends GetxController {
  
   NotificationsData notificationData= NotificationsData(Get.find()) ; 
   List data = [];
  StatusRequest statusRequest = StatusRequest.none ;
    MyServices myServices = Get.find();
    getData() async {
      statusRequest = StatusRequest.loading;
       update();
      var response = await notificationData.getData(myServices.sharedPreferences.getInt("id").toString() ) ; 
      print("=========================== $response");
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
          data.addAll(response['data']);
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();


    }
    @override
  void onInit() {
getData();
    super.onInit();
  }







}