

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class CheckEmailData{
CheckEmailData(this.crud);
Crud crud;

postData(String email)async{

var response = await crud.postData(linkApi.checkemailLink, {
  "email" : email 
});
return response.fold((l)=>l, (r)=>r);


}



}