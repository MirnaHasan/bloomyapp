

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class CheckOutData{

CheckOutData(this.crud);
  Crud crud ;
checkout(Map data )async{
var response = await crud.postData(linkApi.linkcheckorder , data);
return response.fold((l)=>l,(r)=>r);


  }



}







