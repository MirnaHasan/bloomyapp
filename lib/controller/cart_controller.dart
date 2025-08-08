
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
 

List data = [] ;
MyServices myServices = Get.find();
StatusRequest statusRequest = StatusRequest.none ;
CartData favoriteData = CartData(Get.find());

add(String itemsid )async{

    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await favoriteData.addtocart(myServices.sharedPreferences.getInt("id").toString() , itemsid);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
         Get.rawSnackbar(title: "اشعار" , messageText:  Text("تم اضافة المنتج الى السلة ") );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  
}
delete(String itemsid )async{
  data.clear();
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await favoriteData.deletfromcart(myServices.sharedPreferences.getInt("id").toString() , itemsid);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(title: "اشعار" , messageText:  Text("تم حذف المنتج من االسلة ") );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
}}