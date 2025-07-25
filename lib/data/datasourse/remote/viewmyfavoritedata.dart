
import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class MyFavoriteData{
  MyFavoriteData(this.crud);
  Crud  crud ; 
  viewMyFavorite(String id )async{
    var response = await crud.postData(linkApi.linkviewfavorite, {
   "id" : id .toString()
    });
    return response.fold((l)=>l, (r)=>r);
  }

    deletfromFavorite(String favoriteid )async{
    var response = await crud.postData(linkApi.linkdeletfromfavorite, {
   "favoriteid" : favoriteid
    });
    return response.fold((l)=>l, (r)=>r);
  }



}