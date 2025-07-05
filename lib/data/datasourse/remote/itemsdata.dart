
import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class ItemsData{

  ItemsData(this.crud);
  Crud crud ;
  getData()async{
var response = await crud.postData(linkApi.linkitems , {});
return response.fold((l)=>l,(r)=>r);


  }



}