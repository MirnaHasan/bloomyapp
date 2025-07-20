



import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class FavoriteData{
  FavoriteData(this.crud);
  Crud  crud ; 
  addFavorite(String userid , String itemsid)async{
    var response = await crud.postData(linkApi.linkaddfavorite, {
      "userid" : userid , 
      "itemsid" : itemsid ,
    });
    return response.fold((l)=>l, (r)=>r);
  }
  

  removeFavorite(String userid , String itemsid)async{
    var response = await crud.postData(linkApi.linkremovefavorite, {
         "userid" : userid , 
      "itemsid" : itemsid ,
    });
    return response.fold((l)=>l, (r)=>r);
  }

}