



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
  });
}
 
requestpermissionNotification()async{
 NotificationSettings settings= await FirebaseMessaging.instance.requestPermission(
  alert: true,
  badge: true,
  sound: true,
);
} 
