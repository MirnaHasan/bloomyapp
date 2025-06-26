


import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController{
  StatusRequest statusRequest = StatusRequest.none;
  LoginData logindata = LoginData(Get.find());
  MyServices myServices = Get.find();

signIn();
goTosignUp();
goToForgetPaaword ();

}

class SignInControllerImp extends SignInController{

  late TextEditingController email ; 
  late TextEditingController password ;
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  bool isshowPass = true ;
  showPassword(){
    isshowPass =  isshowPass == true ? false : true ;
    update();
  }
  @override
  signIn()async{
    var formData = formState.currentState ;
    if(formData!.validate()){
    statusRequest = StatusRequest.loading ; 
      update() ; 
      var response = await logindata.postData( email.text, password.text, );

      statusRequest =  handlingData(response);
      print("==============$response");
      if (StatusRequest.success == statusRequest){
        if(response["status"] == "success"){
          myServices.sharedPreferences.setInt("id", response['data']['users_id']);
           myServices.sharedPreferences.setString("username", response['data']['users_name']);
            myServices.sharedPreferences.setString("phone", response['data']['users_phone']);
             myServices.sharedPreferences.setString("email", response['data']['users_email']);
              myServices.sharedPreferences.setString("step", "2");
          //  data.addAll(response); 
    Get.offNamed(AppRoutes.homepage );
        }else{
           Get.defaultDialog(
          title: "Alret" , 
          middleText:  "Either Email Or Phone Isn't Correct"
        ) ; 
          statusRequest = StatusRequest.failure ;
          
        }
      }
update();
    }

  
  }
  @override
  goToForgetPaaword() {
 Get.offNamed(AppRoutes.forgetpassword);
  }


@override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("====================================") ;
      print(value);
      String? token = value ;
      
    },);
   email = TextEditingController();
   password= TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
  email.dispose() ;
  password.dispose();
    super.dispose();
  }
  
  @override
  goTosignUp() {
  Get.offNamed(AppRoutes.signUpScreen);
  }
  
  
}