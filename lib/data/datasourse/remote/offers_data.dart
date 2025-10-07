



import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class OffersData{

  OffersData(this.crud);
  Crud crud ;
  getData()async{
var response = await crud.postData(linkApi.linkoffers , {});
return response.fold((l)=>l,(r)=>r);


  }



}