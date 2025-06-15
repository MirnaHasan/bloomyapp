

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class SignUpData {
  SignUpData(this.crud);
  Crud crud ;

  postData(String username , String email , String password , String phone)async{
    var response = await crud.postData(linkApi.linkSignUp, {
      "username" : username , 
      "email" : email, 
      "password" : password , 
      "phone" : phone
    });
    return response.fold((l)=> l, (r)=>r) ;

  }


}