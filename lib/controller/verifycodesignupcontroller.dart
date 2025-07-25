


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/auth/verfiycodesignup.dart';


import 'package:get/get.dart';


abstract class VerifyCodeSignUpController extends GetxController{
  goToSuccessSignUp(String verificationCodeSignup) ;
  checkCode();
  resendVerfiyCode() ;

}

class  VerifyCodeSignUpControllerImp extends  VerifyCodeSignUpController{
 
 String? email ; 
 StatusRequest statusRequest = StatusRequest.none ;
 VerfiycodeSignupData verfiycodeSignupData = VerfiycodeSignupData(Get.find());
    @override
  checkCode() {
   
  
  }
    @override
  goToSuccessSignUp(verificationCodeSignup) async{
    statusRequest = StatusRequest.loading ; 
    update();
    var response = await verfiycodeSignupData.postData(email!,verificationCodeSignup.trim() ) ; 
    statusRequest = await handlingData(response) ; 
    if (StatusRequest.success == statusRequest){
      if (response["status"] == "success"){
        Get.offNamed(AppRoutes.successSignup);
      }else{
        Get.defaultDialog(
          title: "Wrning" , 
          middleText: "Verfiycode isnt correct" 
        );
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
  
  @override
  resendVerfiyCode(){
 
  verfiycodeSignupData.resendData(email!, ) ; 
    
  }
  // @override
  // void dispose() {

  //   super.dispose();
  // }
  

  

}