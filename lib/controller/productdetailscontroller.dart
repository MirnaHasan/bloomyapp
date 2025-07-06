

import 'package:bloomy/data/model/items.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {

}


class ProductDetailsControllerImp extends ProductDetailsController{
late ItemsModel itemsModel ;

  @override
  void onInit() {
 initialData();
    super.onInit();
  }
  initialData(){
      itemsModel = Get.arguments['itemsmodel'];
  }

}