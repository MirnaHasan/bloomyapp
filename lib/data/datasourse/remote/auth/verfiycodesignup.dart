

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class VerfiycodeSignupData {
VerfiycodeSignupData (this.crud);
Crud crud ;

postData(String email , String verfiycode)async{
var response = await crud.postData(linkApi.linkVerfiyCode, {
"email" : email ,
"verfiycode" : verfiycode 

});
return  response.fold((l)=>l, (r)=>r) ;

}




}