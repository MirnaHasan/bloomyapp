import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/auth/signup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
goToSignIn();
signUp();

}

class SignUpControllerImp extends SignUpController{
  bool obscureshowpassword = true ; 
  showObScure(){
    obscureshowpassword =obscureshowpassword == true ? false : true ;
    update(); 
  }
  
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest ;
  List data = [] ; 
  SignUpData signupData = SignUpData(Get.find());
    @override
  signUp() async{
    var formData  = formState.currentState ;
    if (formData!.validate()){
      statusRequest = StatusRequest.loading ; 
      update() ; 
      var response = await signupData.postData(username.text, email.text, password.text, phone.text);

      statusRequest =  handlingData(response);
      print("==============$response");
      if (StatusRequest.success == statusRequest){
        if(response["status"] == "success"){
          //  data.addAll(response); 
    Get.offNamed(AppRoutes.verifycodesignup ,arguments: {
      "email" : email.text ,
    });
        }else{
           Get.defaultDialog(
          title: "Alret" , 
          middleText:  "Phone Number Or Email Already Exited"
        ) ; 
          statusRequest = StatusRequest.failure ;
          
        }
      }
update();

    }
   
  }
  

  late TextEditingController email ; 
  late TextEditingController password ;
  
  late TextEditingController username ; 
  
  late TextEditingController phone; 
 
  @override
  goToSignIn() {
      Get.offNamed(AppRoutes.signInScreen);
  
  }

  


@override
  void onInit() {
  email = TextEditingController();
  password= TextEditingController();
  username= TextEditingController();
  phone= TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
  email.dispose() ;
  password.dispose();
  username.dispose();
  phone.dispose();
    super.dispose();
  }
  

}