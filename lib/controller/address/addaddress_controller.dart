

import 'dart:async';

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading ;
  Position? position;
   CameraPosition? kGooglePlex ;
  Completer<GoogleMapController>? controllercompleter;

  // static const CameraPosition _kLake = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(37.43296265331129, -122.08832357078792),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  getCurrentLocation() async {
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
