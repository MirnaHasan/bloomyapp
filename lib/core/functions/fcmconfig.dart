



// ignore_for_file: strict_top_level_inference, avoid_print

import 'package:bloomy/controller/orders/pendingorderscontroller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
  import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';


fcmconfig() {
  print("===============Hai==================");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("=================Notifications====================");
    print(message.notification!.title);
    print(message.notification!.body);
   FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!) ; 
     refreshpageNotification(message.data) ; 
  });
}
 
requestpermissionNotification()async{
 NotificationSettings settings= await FirebaseMessaging.instance.requestPermission(
 alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
} 





refreshpageNotification(data){
  print("==============================pageId") ;
  print(data['pageid']);
  print("==============================pageName") ;
  print(data['pagename']);

  Future.delayed(Duration(milliseconds: 100), () {
    print("====================CurrentRoute") ; 
    print(Get.currentRoute);
  });
  if (Get.currentRoute == "/pendingorders" && data['pagename'] == "refreshorderpending"){
    print("===============================refreshorder") ;
    PendingOrdersController controller = Get.find() ;
    controller.refreshorder() ; 


  }
}