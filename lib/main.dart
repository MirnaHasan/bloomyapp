
import 'package:bloomy/binding/mybinding.dart';
import 'package:bloomy/core/localization/changelocale.dart';
import 'package:bloomy/core/localization/mytranslation.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/routes.dart';

import 'package:bloomy/view/screen/language.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';




void main() async{
  
   WidgetsFlutterBinding.ensureInitialized();
 await initialService();
  
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    ChangLocalController controller = Get.put(ChangLocalController ());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
     initialBinding: MyBindings(),
      locale:controller.language,
      theme: controller.appTheme ,
    //  home : LanguageApp(), // تم استخدام middleware لذلك حذف home
      getPages: routes,
    );
  }
}
