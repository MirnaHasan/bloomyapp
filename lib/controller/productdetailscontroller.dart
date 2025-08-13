

import 'package:bloomy/controller/cart_controller.dart';
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/cart_data.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {

}


class ProductDetailsControllerImp extends ProductDetailsController{
late ItemsModel itemsModel ;
 late String heroTag;
int countitems = 0 ;
StatusRequest statusRequest = StatusRequest.none ;
MyServices myServices = Get.find() ;
CartData cartData = CartData(Get.find());
// CartController cartController = Get.put(CartController()) ;
List subItems = [
  {"name" : "small", 
  "id" : 1, 
  "active" : "0"} , 
    {"name" : "medium", 
  "id" : 2, 
  "active" : "0"} , 
    {"name" : "big", 
  "id" : 3, 
  "active" : "1"}
  

];

  @override
  void onInit() {
 initialData();

    super.onInit();
  }
  
addItems(String itemsid )async{

    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await cartData.addtocart(myServices.sharedPreferences.getInt("id").toString() , itemsid);
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
  update() ;
}
deleteItems(String itemsid )async{

    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await cartData.deletfromcart(myServices.sharedPreferences.getInt("id").toString() , itemsid);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       
        Get.rawSnackbar(title: "اشعار" , messageText:  Text("تم حذف المنتج من االسلة ") );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update() ;
}

getcountitemscart(String itemsid )async{
  
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await cartData.getcountitems(myServices.sharedPreferences.getInt("id").toString() , itemsid);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        int countItems = 0 ;
       countItems = response['data'] ; 
       print("======================================") ; 
       print(countItems) ; 
       return countItems ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
}


  initialData()async{
    statusRequest= StatusRequest.loading ;
      itemsModel = Get.arguments['itemsmodel'];
       heroTag = Get.arguments['heroTag'];
      countitems= await getcountitemscart(itemsModel.itemsId.toString()) ;
       statusRequest = StatusRequest.success ;
       update();
  }
  add(){
 addItems(itemsModel.itemsId.toString());
    countitems = countitems+1 ; 
    update();
  }
  delete(){
    if (countitems>0){
deleteItems((itemsModel.itemsId.toString()));
          countitems = countitems-1 ; 
          update() ;
    }

  }}