

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class LoginData{
 LoginData(this.crud);
 Crud crud ; 


 postData(String email , String password)async{
  var response = await crud.postData( linkApi.linkLogIn , {
"email" : email ,
"password" : password , 
  });
  print("=========================$response");
  return response.fold((l)=>l ,  (r)=>r);
 }


}