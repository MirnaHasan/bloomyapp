

import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
    initialData();
    chaneCategory(val);

}


class ItemscontrollerImp extends ItemsController {
List categories = [] ; 
int? selectedCategory ;
     @override
  void onInit() {
   categories = Get.arguments['categories'];
   selectedCategory = Get.arguments['selectedcategory'] ;
    super.onInit();
  }
  @override
  initialData() {

  }
  
  @override
  chaneCategory(val) {
   selectedCategory = val ; 
   update();
  }
 

}