

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class DetailsOrdersData{

  DetailsOrdersData(this.crud);
  Crud crud ;
  getData(String orderid)async{
var response = await crud.postData(linkApi.linkdetailsorders , {
  "orderid" : orderid

});
return response.fold((l)=>l,(r)=>r);


  }



}