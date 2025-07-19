

import 'package:get/get_state_manager/get_state_manager.dart';

class FavoriteController extends GetxController {
Map isFavorite = {} ; 
// key = id items
//value = 0 or 1  يلي متخزنة بالعمود favorite 
setFavorite(id , val){
  isFavorite[id] = val ;
  update();
}


}