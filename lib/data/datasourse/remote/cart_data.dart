


import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class CartData{
  CartData(this.crud);
  Crud  crud ; 
  addtocart(String userid , String itemsid)async{
    var response = await crud.postData(linkApi.linkaddtocart, {
      "userid" : userid , 
      "itemsid" : itemsid ,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  

  deletfromcart(String userid , String itemsid)async{
    var response = await crud.postData(linkApi.linkdeletfromcart, {
         "userid" : userid , 
      "itemsid" : itemsid ,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
  getcountitems(String userid , String itemsid)async{
    var response = await crud.postData(linkApi.linkgetcountitemscart, {
         "userid" : userid , 
      "itemsid" : itemsid ,
    });
    return response.fold((l)=>l, (r)=>r);
  }

  viewcart(String userid )async{
    var response = await crud.postData(linkApi.linkviewcart, {
         "userid" : userid , 
      
    });
    return response.fold((l)=>l, (r)=>r);
  }



}