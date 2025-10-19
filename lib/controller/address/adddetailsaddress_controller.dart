import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/functions/showsnackbar.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/address/addressdata.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class AddDetailsaAddressController extends GetxController {
StatusRequest statusRequest = StatusRequest.none;
String? lat ; 
String? long ;
TextEditingController? city ;
TextEditingController? street ;
TextEditingController? name ;
 MyServices myServices = Get.find();


  AddressData addaddressData= AddressData(Get.find()) ; 
  

    
    addDetailsAddress()async{
      statusRequest = StatusRequest.loading;
      update();
      var response = await addaddressData.addaddress( 
        myServices.sharedPreferences.getInt("id")!.toString() , 
        city!.text , street!.text , name!.text ,lat.toString() ,long.toString()
      );
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status'] == 'success'){
          Get.offAllNamed(AppRoutes.homepage) ;
          showSnackbar(title: "تنبيه", message: "Now You Can Order To This Address") ; 
             
        }else{
          statusRequest = StatusRequest.failure ;
        }
           update();
      }
     


    }

initialData () {
  city = TextEditingController();
  street = TextEditingController() ; 
  name = TextEditingController() ;

  lat = Get.arguments['lat']; 
  long = Get.arguments['long'];
  print("Latitude: $lat");
  print("Longitude: $long");

}

  @override
  void onInit() {
    initialData() ;
  
    super.onInit();

  }

}