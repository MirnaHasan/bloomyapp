

import 'package:bloomy/core/services/services.dart';
import 'package:get/instance_manager.dart';

translatFromDataBase (columnar , columnen ){
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang")=="ar"){
    return columnar ;

  }else {
  return columnen ;
  }

}