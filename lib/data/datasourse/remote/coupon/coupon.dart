
import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class CouponData{

  CouponData(this.crud);
  Crud crud ;
  checkCoupon(String couponName)async{
var response = await crud.postData(linkApi.linkcouponcheck , {
  "couponname" : couponName 
});
return response.fold((l)=>l,(r)=>r);


  }



}