

import 'package:get/get_utils/get_utils.dart';

validInput(String val , int min , int max , String type){
if(type == "email"){
  if(!GetUtils.isEmail(val)){
    return "can't be valid email";
  }
}
if(type == "phone"){
  if(!GetUtils.isPhoneNumber(val)){
      return "can't be valid phonenumber";
  }
}
if(type == "username"){
  if(!GetUtils.isUsername(val)){
      return "can't be valid username";
  }
}
if(val.isEmpty){
  return "can't be empty";
}
if(val.length<min){
  return "can't be less than $min";
}
if(val.length> max){
  return "can't be greater than $max " ;
}



}