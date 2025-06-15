
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/test_data.dart';
import 'package:get/get.dart';


class TestController extends GetxController{

   TestData testData= TestData(Get.find()) ; 
   List data = [];
  StatusRequest? statusRequest ;
    
    getDataFromDatabase()async{
      statusRequest = StatusRequest.loading;
      // update();
      var response = await testData.getData();
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
    @override
  void onInit() {
getDataFromDatabase();
    super.onInit();
  }






}