


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';

import 'package:bloomy/data/datasourse/remote/viewmyfavoritedata.dart';
import 'package:bloomy/data/model/myfavorite.dart';

import 'package:get/get.dart';


class MyFavoriteController extends GetxController {

List<MyFavoriteModel> data = [] ;
MyServices myServices = Get.find();
StatusRequest statusRequest = StatusRequest.none ;
MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

viewMyFavorite
( )async{
  data.clear();
    statusRequest = StatusRequest.loading ;
    update() ; 
    var response = await myfavoriteData.viewMyFavorite(myServices.sharedPreferences.getInt("id").toString() ,);
        print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       List responsedata = response['data'] ;
       data.addAll(responsedata.map((e)=>MyFavoriteModel.fromJson(e))) ;
       print("dataaaaa ") ; 
       print(data) ;

      } else {
        statusRequest = StatusRequest.failure;
      }
      update() ;
    }
  
}

deletefromMyFavorite
( String favoriteid ){
 
    var response =  myfavoriteData.deletfromFavorite(favoriteid);
  


        data.removeWhere((element)=>element.favoriteId.toString() == favoriteid);
    
      update() ;
    
  
}


@override
  void onInit() {
viewMyFavorite() ;
    super.onInit();
  }


}