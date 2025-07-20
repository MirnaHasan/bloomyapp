

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/favorite_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavoriteController extends GetxController {
Map isFavorite = {} ; 
List data = [] ;
MyServices myServices = Get.find();
StatusRequest statusRequest = StatusRequest.none ;
FavoriteData favoriteData = FavoriteData(Get.find());
// key = id items
//value = 0 or 1  يلي متخزنة بالعمود favorite 
setFavorite(id , val){
  isFavorite[id] = val ;
  update();
}
addFavoritefromdata(String itemsid )async{
  data.clear();
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await favoriteData.addFavorite(myServices.sharedPreferences.getInt("id").toString() , itemsid);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
         Get.rawSnackbar(title: "اشعار" , messageText:  Text("تم اضافة المنتج الى المفضلة ") );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  
}
removeFavoritefromdata(String itemsid )async{
  data.clear();
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await favoriteData.removeFavorite(myServices.sharedPreferences.getInt("id").toString() , itemsid);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(title: "اشعار" , messageText:  Text("تم حذف المنتج من المفضلة ") );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

}


}