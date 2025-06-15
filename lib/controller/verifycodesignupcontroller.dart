


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/auth/verfiycodesignup.dart';
import 'package:bloomy/view/screen/Auth/verifycodesignup.dart';

import 'package:get/get.dart';


abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp() ;
  checkCode();

}

class  VerifyCodeSignUpControllerImp extends  VerifyCodeSignUpController{
 late String verifyCode ;
 String? email ; 
 StatusRequest? statusRequest ;
 VerfiycodeSignupData verfiycodeSignupData = VerfiycodeSignupData(Get.find());
    @override
  checkCode() {
   
  
  }
    @override
  goToSuccessSignUp() async{
    statusRequest = StatusRequest.loading ; 
    update();
    var response = await verfiycodeSignupData.postData(email!,verifyCode ) ; 
    statusRequest = await handlingData(response) ; 
    if (StatusRequest.success == statusRequest){
      if (response['status']== "success"){
        Get.offNamed(AppRoutes.successSignup);
      }else{
        statusRequest = StatusRequest.failure ;
      }

    }

update();

  }

@override
  void onInit() {
    email = Get.arguments['email'];
 
    super.onInit();
  }
  // @override
  // void dispose() {

  //   super.dispose();
  // }
  

  

}