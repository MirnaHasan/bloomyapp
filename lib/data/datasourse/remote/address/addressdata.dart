


import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class AddressData{
 AddressData(this.crud);
 Crud crud; 

 addaddress( String userid , String city , String street , String name , String lat , String long)async{
  var response = await crud.postData( linkApi.linkaddaddress , {
    "userid" : userid , 
  "city" : city ,
  "street" : street , 
  "name" : name , 
  "lat" : lat , 
  "long": long
  });
  print("=========================$response");
  return response.fold((l)=>l ,  (r)=>r);
 }
 viewaddress(String addressuserid)async{
  var response = await crud.postData( linkApi.linkviewaddress , {
"addressuserid" : addressuserid , 
  });
  // print("=========================$response");
  return response.fold((l)=>l ,  (r)=>r);
 }
  editaddress(String city , String street , String name , String addressid ,   String lat , String long)async{
  var response = await crud.postData( linkApi.linkeditaddress , {
  "city" : city ,
  "street" : street , 
  "name" : name , 
  "addressid" : addressid , 
  "lat" : lat , 
  "long" : long ,
  });
  print("=========================$response");
  return response.fold((l)=>l ,  (r)=>r);
 }
 deleteaddress(String addressid)async{
  var response = await crud.postData( linkApi.linkdeleteaddress , {
  "addressid" : addressid 
  });
  print("=========================$response");
  return response.fold((l)=>l ,  (r)=>r);
 }




}