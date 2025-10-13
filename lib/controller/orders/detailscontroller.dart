

import 'dart:async';

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/orders/detailsordersdata.dart';
import 'package:bloomy/data/model/cartmodel.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:bloomy/data/model/orderdetailsmodel.dart';
import 'package:bloomy/data/model/ordermodel.dart';
import 'package:bloomy/data/model/pendingorders.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class OrdersDetailsController extends GetxController {
OrdersModel? ordermodel ; 
  //  Position? position;
  CameraPosition? cameraPosition ;
  // Completer<GoogleMapController>? controllercompleter ;
  Completer<GoogleMapController> controllercompleter = Completer();
  double? lat ; 
double? long ;
  List <Marker> markers = [] ;
    
 DetailsOrdersData detailsordersData= DetailsOrdersData (Get.find()) ; 
   List<CartModel> data = [];
  StatusRequest statusRequest = StatusRequest.none ;


initialData()async{
if (ordermodel!.ordersType.toString() == "0"){
   cameraPosition = CameraPosition(
      target: LatLng(ordermodel!.addressLat!, ordermodel!.addressLong!),
      zoom: 12.4746,
    );
    markers.add(Marker(markerId: MarkerId("1") , position: LatLng(ordermodel!.addressLat!, ordermodel!.addressLong!)) ) ;
    update() ;
}
   
}
  @override
  void onInit() {
ordermodel = Get.arguments["orderdetails"] ; 
    initialData() ;
      getData() ; 
    super.onInit();
  }



    
    getData()async{
      statusRequest = StatusRequest.loading;
      // update();
      var response = await detailsordersData.getData(ordermodel!.ordersId.toString());
      print(response);
      statusRequest =  await handlingData(response);
      if (StatusRequest.success == statusRequest){
        if(response['status']== 'success'){
         List listdata = response['data'] ; 
         data.addAll(listdata.map((e)=> CartModel.fromJson(e))) ;
        }else{
          statusRequest = StatusRequest.failure ;
        }
        
      }
       update();


    }
 

}