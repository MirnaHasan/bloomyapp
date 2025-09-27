

import 'dart:async';

import 'package:bloomy/data/model/pendingorders.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class OrdersDetailsController extends GetxController {
  PendingOrdersModel? ordermodel ; 
  //  Position? position;
  CameraPosition? cameraPosition ;
  // Completer<GoogleMapController>? controllercompleter ;
  Completer<GoogleMapController> controllercompleter = Completer();
  double? lat ; 
  double? long ;
  List <Marker> markers = [] ;


initialData()async{

    cameraPosition = CameraPosition(
      target: LatLng(34.22, 37.3),
      zoom: 12.4746,
    );
    update() ;
}
  @override
  void onInit() {
    ordermodel = Get.arguments["orderdetails"] ; 
    initialData() ;
    super.onInit();
  }

}