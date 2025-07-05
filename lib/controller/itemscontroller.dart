

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/itemsdata.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
    initialData();
    chaneCategory(val);
    getItems();

}


class ItemscontrollerImp extends ItemsController {
   ItemsData itemsData= ItemsData(Get.find()) ; 
   StatusRequest statusRequest = StatusRequest.none ;
    List data = [];
List categories = [] ; 
int? selectedCategory ;
     @override
  void onInit() {
initialData();
    super.onInit();
  }
  @override
  initialData() {
  categories = Get.arguments['categories'];
   selectedCategory = Get.arguments['selectedcategory'] ;
   getItems();
     
  }
  
  @override
  chaneCategory(val) {
   selectedCategory = val ; 
   update();
  }
  
  @override
  getItems() async{ 
      statusRequest = StatusRequest.loading;
      // update();
      var response = await itemsData.getData();
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
         data.addAll(response['data']);
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();


    }

 
  }
 

