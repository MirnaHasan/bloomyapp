

import 'package:bloomy/controller/cart_controller.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {

}


class ProductDetailsControllerImp extends ProductDetailsController{
late ItemsModel itemsModel ;
CartController cartController = Get.put(CartController()) ;
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
  initialData(){
      itemsModel = Get.arguments['itemsmodel'];
  }

}