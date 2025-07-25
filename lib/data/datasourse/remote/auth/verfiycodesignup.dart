

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class VerfiycodeSignupData {
VerfiycodeSignupData (this.crud);
Crud crud ;

postData(String email , String  verifycode)async{
var response = await crud.postData(linkApi.linkVerfiyCodesignup, {
"email" : email ,
"verifycode" :  verifycode ,

});

return  response.fold((l)=>l, (r)=>r) ;

}
resendData(String email )async{
var response = await crud.postData(linkApi.linkresendverfiycode, {
"email" : email ,


});

return  response.fold((l)=>l, (r)=>r) ;

}




}