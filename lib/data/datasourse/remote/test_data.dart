

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class TestData{

  TestData(this.crud);
  Crud crud ;
  getData()async{
var response = await crud.postData(linkApi.linkTest , {});
return response.fold((l)=>l,(r)=>r);


  }



}