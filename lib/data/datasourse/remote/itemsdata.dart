
import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class ItemsData{

  ItemsData(this.crud);
  Crud crud ;
  getData(String id , String userid )async{
var response = await crud.postData(linkApi.linkitems , {
  "id" : id,
  "userid" : userid, 
});
print("========================$response");
return response.fold((l)=>l,(r)=>r);


  }



}