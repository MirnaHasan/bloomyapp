
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/cart_data.dart';
import 'package:bloomy/data/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
 

MyServices myServices = Get.find();
StatusRequest statusRequest = StatusRequest.none ;
CartData cartData = CartData(Get.find());
List<CartModel> data = [] ; 
double priceorders = 0.0 ; 
int totalCountItems = 0 ; 


add(String itemsid )async{

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
  
}
delete(String itemsid )async{

    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await cartData.deletfromcart(myServices.sharedPreferences.getInt("id").toString() , itemsid);
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


view()async{
  
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await cartData.viewcart(myServices.sharedPreferences.getInt("id").toString() );
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['cartdata'] ;
        Map dataresponsepricecount = response['pricecount'] ;
        data.addAll(dataresponse.map((e)=>CartModel.fromJson(e))) ;
        totalCountItems = int.parse(dataresponsepricecount['totalcountitems']);
        priceorders = (dataresponsepricecount['totalprice'] as num).toDouble();

   
       
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update() ;
}
@override
  void onInit() {
view();
    super.onInit();
  }






}