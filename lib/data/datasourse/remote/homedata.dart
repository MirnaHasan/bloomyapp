

import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class HomeData{
  HomeData(this.crud);
  Crud  crud ; 
  postdata()async{
    var response = await crud.postData(linkApi.homeLink, {});
    return response.fold((l)=>l, (r)=>r);
  }
  
}