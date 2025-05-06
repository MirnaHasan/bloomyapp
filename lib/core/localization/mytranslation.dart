

import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {
   "ar" :{
    "1" : " اختر اللغة من فضلك",
    "2" : "العربية",
    "3": "الانكليزية"
   },
   "en" :{
    "1": "Choose Language please" , 
    "2" : "Arabic" , 
    "3":"English",
   },

  };
}