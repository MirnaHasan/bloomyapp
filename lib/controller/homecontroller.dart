
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/homedata.dart';

import 'package:get/get.dart';

 abstract class HomeController extends GetxController {
 initialData() ;
 getdata();
 goToItems(List categories , int selectedCategory , String categoryid) ;

}


class HomeComtrollerImp extends HomeController {
  String? username;
  String? lang ;
  int? id ;
  MyServices myServices = Get.find();
  HomeData homeData =HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none ;
  List items = [] ;
  List categories = [] ;
  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }
  
  @override
  getdata() async{
    
   statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.postdata();
     print("==================================$response");
      statusRequest =  await handlingData(response);
    
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
      categories.addAll(response['categories']);
        items.addAll(response['items']);
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();
  }
  
  @override
  goToItems( categories ,selectedCategory ,categortid) {
   Get.toNamed(AppRoutes.items, arguments: {
  "categories" : categories , 
  "selectedcategory" : selectedCategory ,
  "categoryid" : categortid ,
   });
  }
}
