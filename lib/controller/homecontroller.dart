
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/homedata.dart';
import 'package:get/get.dart';

 abstract class HomeController extends GetxController {
 initialData() ;
 getdata();

}


class HomeComtrollerImp extends HomeController {
  String? username;
  MyServices myServices = Get.find();
  HomeData homeData =HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none ;
  List data = [] ;
  List categories = [] ;
  initialData() {
    username = myServices.sharedPreferences.getString("username");
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
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();
  }
}
