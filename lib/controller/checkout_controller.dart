


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/address/addressdata.dart';
import 'package:bloomy/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find())) ; 
  StatusRequest statusRequest = StatusRequest.none ; 
  MyServices myServices = Get.find() ;
  List<AddressModel> data = [] ;

String? paymentMethod ;

String? deliveryType ;

String? addressId ;
late int couponid ; 
 late double priceorder ;

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
@override
  void onInit() {
   couponid = Get.arguments['couponid'] ; 
    priceorder = Get.arguments['priceorder'] ; 

  getShippingAddress() ; 
    super.onInit();
  }






}