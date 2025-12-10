

import 'dart:async';


import 'package:bloomy/core/class/statusrequest.dart';

import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/model/ordermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class TrackingController extends GetxController {
  // AcceptedOrdersController controller = Get.find() ;
  MyServices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  GoogleMapController? gmc;

  List<Marker> markers = [];
  Set<Polyline> polylineSet = {};
  CameraPosition? cameraPosition;

  double? currentlat;
  double? currentlong;
    double? destlat;
  double? destlong;
 
  StreamSubscription<Position>? positionStream;

  @override
  void onInit() {
    // تهيئة ordersModel أولاً
    ordersModel = Get.arguments['orderdetails'];
   
     
    getinitialdata();
    getLocationDelivery() ;
   
    super.onInit();
  }
  getLocationDelivery(){
    FirebaseFirestore.instance.
    collection("delivery").
    doc(ordersModel.ordersId.toString()).
    snapshots().listen((event){
  if (event.exists){
    destlat = double.parse(event.get("lat")) ; 
    destlong =double.parse( event.get("long") );
    updateMarkerDelivery(destlat!, destlong!) ;
     
     }
    }) ;

  }


updateMarkerDelivery(double newlat , double newlong){
 
      markers.removeWhere((e) => e.markerId.value == "dest");
      markers.add(
        Marker(
          markerId: MarkerId("dest"),
          position: LatLng(newlat, newlong),
        ),
        
      );
      update() ;

}
  void getinitialdata() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.5,
    );

    // Marker للوجهة
    markers.add(
      Marker(
        markerId: MarkerId("current"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      ),
    );
    
  }

  // جلب المسار من OSRM
  // Future<List<LatLng>> getRouteFromOSRM(
  //     double originLat,
  //     double originLng,
  //     double destLat,
  //     double destLng,
  // ) async {
  //   String url =
  //       "http://router.project-osrm.org/route/v1/driving/$originLng,$originLat;$destLng,$destLat?overview=full&geometries=geojson";

  //   var response = await http.get(Uri.parse(url));
  //   var data = jsonDecode(response.body);

  //   List<LatLng> polylineCoordinates = [];

  //   if (data['routes'] != null && data['routes'].isNotEmpty) {
  //     List coordinates = data['routes'][0]['geometry']['coordinates'];
  //     polylineCoordinates =
  //         coordinates.map<LatLng>((c) => LatLng(c[1], c[0])).toList();
  //   }

  //   return polylineCoordinates;
  // }


 
 

  // // رسم المسار
  // initialPolyLine() async {
   

  //   double destlat = ordersModel.addressLat!;
  //   double destlong = ordersModel.addressLong!;

  //   List<LatLng> points =
  //       await getRouteFromOSRM(currentlat!, currentlong!, destlat, destlong);

  //   polylineSet.clear();
  //   polylineSet.add(
  //     Polyline(
  //       polylineId: PolylineId("route"),
  //       points: points,
  //       color: const Color.fromARGB(255, 13, 115, 16),
  //       width: 6,
  //     ),
  //   );
  // }

  @override
  void onClose() {
    positionStream?.cancel();
    gmc!.dispose();
  
    super.onClose();
  }
}
