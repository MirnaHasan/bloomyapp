

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none ; 

String? paymentMethod ;

String? deliveryType ;

String? addressId ;

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





}