

import 'package:bloomy/core/class/crud.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
  Get.put(Crud());
 
  }
}