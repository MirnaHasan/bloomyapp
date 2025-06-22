



import 'package:bloomy/core/class/statusrequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response ;

  }
  else{
    return StatusRequest.success;

  }


}
// response يلي عم يرجعلي من getdata هو اما map or statusrequest
// اذا كان الريسبونس من نوع ستاتوس ريكويست رجعلي الريسبونس 
// و الا اذا ما كان من نوع ستيستوس ريكويست اي هو من نوع ماب رجعلي statusrequest.succes