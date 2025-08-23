

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/address/addressdata.dart';
import 'package:bloomy/data/model/addressmodel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {

  AddressData addressData= AddressData(Get.find()) ; 
   List<AddressModel> data = [];
  StatusRequest statusRequest = StatusRequest.none ;
  MyServices myServices = Get.find() ;
    
    viewAddress()async{
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.viewaddress(myServices.sharedPreferences.getInt("id").toString());
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
          List dataresponse = response['data'] ;
          data.addAll(dataresponse.map((e)=>AddressModel.fromJson(e))) ; 
if(data.isEmpty){
  statusRequest = StatusRequest.failure ;
}
        
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();
    }
    deleteaddress(String addressid){
      addressData.deleteaddress(addressid) ; 
      data.removeWhere((element)=> element.addressId ==int.parse(addressid) ) ;
      update() ;
    }
    @override
  void onInit() {
viewAddress();
    super.onInit();
  }



}