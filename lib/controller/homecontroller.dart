
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/homedata.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:flutter/widgets.dart';
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
  TextEditingController? search ;
  bool isSearch = false ;
  List<ItemsModel> listdata = [] ;
  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getInt("id");
  }

  @override
  void onInit() {
    search =TextEditingController() ;
    getdata();
    initialData();
    super.onInit();
  }
  checkSearch(val){
    if(val== ''){
      isSearch = false ; 

    }
    update() ;
  }
  onSearchItems(){
    isSearch = true ; 
    searchdata() ;
    update() ;
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
      categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();
  }
  searchdata()async{

 
   statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.searchData(search!.text);
     print("==================================$response");
      statusRequest =  await handlingData(response);
    
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
        List responsedata = response['data'] ; 
        print("{$responsedata}") ;
        listdata.addAll(responsedata.map((e)=>ItemsModel.fromJson(e))) ;
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
