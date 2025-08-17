

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class HomeData{
  HomeData(this.crud);
  Crud  crud ; 
  postdata()async{
    var response = await crud.postData(linkApi.homeLink, {});
    return response.fold((l)=>l, (r)=>r);
  }
  searchData(String search)async{
    var response = await crud.postData(linkApi.linksearchItems, {
      "search": search , 
    });
    return response.fold((l)=>l, (r)=>r);
  }
  
}