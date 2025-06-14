import 'package:bloomy/core/class/statusrequest.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});
 final StatusRequest statusRequest ; 
  final Widget widget ;

  @override
  Widget build(BuildContext context) {
    return  
    statusRequest == StatusRequest.loading ? Center(child: Text("loading ..")) : 
    statusRequest == StatusRequest.failure ? Center(child: Text("No Data" , style: TextStyle(fontSize: 20),)) :
    statusRequest == StatusRequest.offlineFailure ? Center(child: Text("OffLine Failure")) :
    statusRequest == StatusRequest.serverfailure ? Center(child: Text("Server Failure")) : widget

    
    ;
  }
}