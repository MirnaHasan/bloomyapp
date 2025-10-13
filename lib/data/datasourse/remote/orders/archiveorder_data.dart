



import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class OrderArchiveData{

  OrderArchiveData(this.crud);
  Crud crud ;
  getData(String usersid)async{
var response = await crud.postData(linkApi.linkarchiveorders , {
  "usersid" : usersid , 
});
return response.fold((l)=>l,(r)=>r);


  }
  rating (String orderid , String comment , String rating)async{
    var response = await crud.postData(linkApi.linkratingorder , {
    "orderid" : orderid  ,
    "comment" : comment , 
    "rating" : rating , 
 
});
return response.fold((l)=>l,(r)=>r);
 
  }



}