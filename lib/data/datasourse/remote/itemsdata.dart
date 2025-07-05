
import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class ItemsData{

  ItemsData(this.crud);
  Crud crud ;
  getData(String id )async{
var response = await crud.postData(linkApi.linkitems , {
  "id" : id.toString() ,
});
print("========================$response");
return response.fold((l)=>l,(r)=>r);


  }



}