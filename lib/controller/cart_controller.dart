
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/cart_data.dart';
import 'package:bloomy/data/model/cartmodel.dart';
import 'package:bloomy/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
 
 int? discountcoupon = 0 ;
 String? couponname ;

MyServices myServices = Get.find();
StatusRequest statusRequest = StatusRequest.none ;
CouponModel? couponModel ;
late TextEditingController controllerCoupon ;
CartData cartData = CartData(Get.find());
List<CartModel> data = [] ; 
double priceorders = 0.0 ; 
int totalCountItems = 0 ; 

checkCoupon()async{
    statusRequest = StatusRequest.loading ;
    
    update() ; 
    var response = await cartData.checkCoupon(controllerCoupon.text);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
     Map<String, dynamic> couponData = response['data'] ; 
     couponModel = CouponModel.fromJson(couponData) ;
    discountcoupon = int.parse(couponModel!.couponDiscount.toString()) ;

       
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update() ;
}
gettotalprice(){
  return (priceorders - priceorders*discountcoupon!/100 );
}

resetVarCart(){
  priceorders = 0.0 ; 
  totalCountItems = 0 ; 
  data.clear() ; 
}
refreshPageCart(){
  resetVarCart() ; 
  view() ; 
}

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
  update() ;
}
delete(String itemsid )async{

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


view()async{
  
    statusRequest = StatusRequest.loading ;
    
    update() ; 
    var response = await cartData.viewcart(myServices.sharedPreferences.getInt("id").toString() );
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       if (response['cartdata']['status']== "success"){
        List dataresponse = response['cartdata']['data'] ;
        Map dataresponsepricecount = response['pricecount'] ;
        data.clear()
;        data.addAll(dataresponse.map((e)=>CartModel.fromJson(e))) ;
        totalCountItems = int.parse(dataresponsepricecount['totalcountitems']);
        priceorders = (dataresponsepricecount['totalprice'] as num).toDouble();
       }

       
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update() ;
}



@override
  void onInit() {
    controllerCoupon = TextEditingController() ; 
view();
    super.onInit();
  }






}