

// مهمة هذا الكلاس التعامل مع الريكويستس سواء الريكويست الذي يتم ارساله 
// الى الباك ايند او الريكويست المستقبل من الباك ايند 
// Either : اذا الميثود بترجع نوعين نستخدم either خاصية البرمجة الوظيفية 
import 'dart:convert';

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/checkinternet.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class Crud {
  // هذه الميثود تتعامل مع الريكويست الذي يتم ارسالة الى او استقباله من باك ايند
  // و تقوم بفحص هل يوجد اتصال بالانترنت

  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    // try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = await jsonDecode(response.body);
       print("========$responsebody");
          return right(responsebody);
          
        } else {
          return left(StatusRequest.serverfailure);
        }
      } else {
        return left(StatusRequest.offlineFailure);
      }
    } 
    // catch (_) {
    //   return left(StatusRequest.serverException);
    // }
  // }
}
