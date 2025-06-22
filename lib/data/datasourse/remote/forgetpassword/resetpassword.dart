

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class ResetPasswordData{
  ResetPasswordData(this.crud);
  Crud crud ; 
postData(String email , String password)async{
var response = await crud.postData(linkApi.resetpasswordLink, {
  "email" : email,
  "password":password
});
return response.fold((l)=>l, (r)=>r);

}}