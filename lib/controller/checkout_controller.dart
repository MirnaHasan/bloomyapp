


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/address/addressdata.dart';
import 'package:bloomy/data/datasourse/remote/checkoutdata.dart';
import 'package:bloomy/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  CheckOutData checkOutData = Get.put(CheckOutData(Get.find())) ; 
  AddressData addressData = Get.put(AddressData(Get.find())) ; 
  
String? paymentMethod ;

String? deliveryType ;

 String addressId = "0";
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
  if(paymentMethod == null) {
    return Get.snackbar(
    "", // نخليه فاضي لأننا بنستخدم titleText و messageText
    "",
    titleText: const Text(
      "تنبيه",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
       color: Color.fromARGB(255, 6, 50, 9), 
      ),
    ),
    messageText: const Text(
      "Choose payment method ",
      style: TextStyle(
        fontSize: 18,
      color: Color.fromARGB(255, 6, 50, 9),
      ),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundGradient: LinearGradient(
      colors: [
         Color(0xFFDFFFD6), // أخضر باهت (Pastel green)
        Color(0xFFB5EAD7), // Mint هادئ
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    icon: const Icon(Icons.eco, color: Color.fromARGB(255, 6, 50, 9), size: 30),
    shouldIconPulse: true,
    duration: const Duration(seconds: 3),
    barBlur: 15,
    overlayBlur: 1,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
  }
if (deliveryType == null) {
  return Get.snackbar(
    "", // نخليه فاضي لأننا بنستخدم titleText و messageText
    "",
    titleText: const Text(
      "تنبيه",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
       color: Color.fromARGB(255, 6, 50, 9), 
      ),
    ),
    messageText: const Text(
      "Choose order delivery type" ,
      style: TextStyle(
        fontSize: 18,
      color: Color.fromARGB(255, 6, 50, 9),
      ),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundGradient: LinearGradient(
      colors: [
         Color(0xFFDFFFD6), // أخضر باهت (Pastel green)
        Color(0xFFB5EAD7), // Mint هادئ
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    icon: const Icon(Icons.eco, color: Color.fromARGB(255, 6, 50, 9), size: 30),
    shouldIconPulse: true,
    duration: const Duration(seconds: 3),
    barBlur: 15,
    overlayBlur: 1,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

   statusRequest = StatusRequest.loading;
   update() ;
   Map checkoutdata = {

"usersid" :  myServices.sharedPreferences.getInt("id").toString() , 

"addressid" :addressId.toString() ,
"ordertype" : deliveryType.toString() ,
"orderpayment" : paymentMethod.toString(),
"couponid" : couponid, 
"orderprice" : priceorder.toString(), 
"orderpricedelivery" : "10"

} ; 

      var response = await checkOutData.checkout(checkoutdata) ;
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){

   print("===========================================Success") ; 
   Get.offAllNamed(AppRoutes.homepage) ;
   Get.snackbar(
    "", // نخليه فاضي لأننا بنستخدم titleText و messageText
    "",
    titleText: const Text(
      "تنبيه",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
       color: Color.fromARGB(255, 6, 50, 9), 
      ),
    ),
    messageText: const Text(
      "The product was ordered successfully",
      style: TextStyle(
        fontSize: 18,
      color: Color.fromARGB(255, 6, 50, 9),
      ),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundGradient: LinearGradient(
      colors: [
         Color(0xFFDFFFD6), // أخضر باهت (Pastel green)
        Color(0xFFB5EAD7), // Mint هادئ
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    icon: const Icon(Icons.eco, color: Color.fromARGB(255, 6, 50, 9), size: 30),
    shouldIconPulse: true,
    duration: const Duration(seconds: 3),
    barBlur: 15,
    overlayBlur: 1,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );

        }else{
          statusRequest = StatusRequest.none ;
          Get.snackbar(
    "", // نخليه فاضي لأننا بنستخدم titleText و messageText
    "",
    titleText: const Text(
      "تنبيه",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
       color: Color.fromARGB(255, 6, 50, 9), 
      ),
    ),
    messageText: const Text(
      "Try Again",
      style: TextStyle(
        fontSize: 18,
      color: Color.fromARGB(255, 6, 50, 9),
      ),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundGradient: LinearGradient(
      colors: [
         Color(0xFFDFFFD6), // أخضر باهت (Pastel green)
        Color(0xFFB5EAD7), // Mint هادئ
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    icon: const Icon(Icons.error_outline_outlined, color: Color.fromARGB(255, 6, 50, 9), size: 30),
    shouldIconPulse: true,
    duration: const Duration(seconds: 3),
    barBlur: 15,
    overlayBlur: 1,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
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