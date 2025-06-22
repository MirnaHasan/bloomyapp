

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/forgetpassword/verifycodeforgetpassword.dart';


import 'package:get/get.dart';


abstract class VerifyCodeController extends GetxController{
goToResetPassword(verifycode);
  checkCode();
 

}

class  VerifyCodeControllerImp extends  VerifyCodeController{

  String? email ;
  VerifyCodeForgetPasswordData verifycodeforgetpasswordData =VerifyCodeForgetPasswordData(Get.find());
  StatusRequest? statusRequest ;
 
    @override
  checkCode() {

   
  
  }
    @override
  goToResetPassword(verifycode)async {
    statusRequest = StatusRequest.loading ; 
    update();
    var response = await verifycodeforgetpasswordData.postData(email!, verifycode) ; 
    statusRequest = handlingData(response);
    if (StatusRequest.success==statusRequest){
      if(response['status']== 'success'){
Get.offNamed(AppRoutes.resetpassword , arguments: {"email": email});
      }else{
        Get.defaultDialog(
          title:  "Warning" ,
          middleText: "Verify Code Isn't Correct"
        );
        statusRequest = StatusRequest.failure ;
      }
      update();
    }

  }
@override
  void onInit() {
   email = Get.arguments['email'];
    super.onInit();
  }
  

  

}