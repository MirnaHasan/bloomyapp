

import 'package:bloomy/controller/cart_controller.dart';
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {

}


class ProductDetailsControllerImp extends ProductDetailsController{
late ItemsModel itemsModel ;
 late String heroTag;
int countitems = 0 ;
StatusRequest statusRequest = StatusRequest.none ;
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
  initialData()async{
    statusRequest= StatusRequest.loading ;
      itemsModel = Get.arguments['itemsmodel'];
       heroTag = Get.arguments['heroTag'];
      countitems= await cartController.getcountitemscart(itemsModel.itemsId.toString()) ;
       statusRequest = StatusRequest.success ;
       update();
  }
  add(){
     cartController.add(itemsModel.itemsId.toString());
    countitems = countitems+1 ; 
    update();
  }
  remove(){
    if (countitems>0){
      cartController.delete((itemsModel.itemsId.toString()));
          countitems = countitems-1 ; 
          update() ;
    }

  }

}