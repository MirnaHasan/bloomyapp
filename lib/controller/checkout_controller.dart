


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/address/addressdata.dart';
import 'package:bloomy/data/datasourse/remote/checkoutdata.dart';
import 'package:bloomy/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find())) ; 
  AddressData addressData = Get.put(AddressData(Get.find())) ; 
  
String? paymentMethod ;

String? deliveryType ;

String? addressId ;
late String couponid ; 
 late String priceorder ;

  
  StatusRequest statusRequest = StatusRequest.none ; 
  MyServices myServices = Get.find() ;
  List<AddressModel> data = [] ;




chossePaymentMethod(String val){
 paymentMethod = val ;
  update() ;

} 
chossedeliveryType(String val){
  deliveryType  = val;
  update() ;

}
chosseShippingAddress(String val){
addressId = val ; 
  update() ; 

}
getShippingAddress()async{
   statusRequest = StatusRequest.loading;
       update();
      var response = await addressData.viewaddress(myServices.sharedPreferences.getInt("id").toString()) ;
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
      List shippingAddressData = response ['data'] ;
      data.addAll(shippingAddressData.map((e)=> AddressModel.fromJson(e))) ;

        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();

}


checkOut()async{
   statusRequest = StatusRequest.loading;
   Map checkoutdata = {


"usersid" :  myServices.sharedPreferences.getInt("id").toString() , 

"addressid" :addressId.toString() ,
"ordertype" : deliveryType.toString() ,
"orderpayment" : paymentMethod.toString(),
"couponid" : couponid, 
"orderprice" : priceorder.toString(), 
"orderpricedelivery" : "10"

} ; 
update();
      var response = await checkOutData.checkout(checkoutdata) ;
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
   print("===========================================Success") ; 

        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();

}


@override
  void onInit() {
   couponid = Get.arguments['couponid']; 
  priceorder = Get.arguments['priceorder']; 

  getShippingAddress() ; 
    super.onInit();
  }






}