

import 'dart:async';
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading ;
  Position? position;
  CameraPosition? kGooglePlex ;
  Completer<GoogleMapController>? controllercompleter ;
  double? lat ; 
  double? long ;
  List <Marker> markers = [] ;
  addMarkers(LatLng latlng){
    markers.clear();    
    markers.add(Marker(markerId: MarkerId("1") , position: latlng)) ;
    lat = latlng.latitude;
    long = latlng.longitude ;
    update() ;
  }
    goToAddDetailsAddress(){
    Get.toNamed(AppRoutes.addaddressdetails , arguments: {
      "lat" : lat.toString(), 
      "long" : long.toString(), 
    }) ;
  }
  getCurrentLocation () async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none ; 
    update() ;
  }
  @override
  void onInit() {
    getCurrentLocation();
    controllercompleter = Completer<GoogleMapController>();
    super.onInit();

  }

}
