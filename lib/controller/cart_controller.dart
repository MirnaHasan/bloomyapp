
import 'dart:ffi';

import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/functions/showsnackbar.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/cart_data.dart';
import 'package:bloomy/data/model/cartmodel.dart';
import 'package:bloomy/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  int? discountcoupon = 0;
  String? couponname;
  int? couponid;
    
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CouponModel? couponModel;
  late TextEditingController controllerCoupon;
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalCountItems = 0;

  checkCoupon() async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await cartData.checkCoupon(controllerCoupon.text);
    print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> couponData = response['data'];
        couponModel = CouponModel.fromJson(couponData);
        discountcoupon = int.parse(couponModel!.couponDiscount.toString());
        couponname = couponModel!.couponName;
         couponid =  couponModel!.couponId;  
      } else {
        //  statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null ; 
        return showSnackbar(title: "Warning", message: "Coupon Not Valid") ;
        
      }
    }
    update();
  }

  gettotalprice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }
  goToCheckoutPage (){
   if (data.isEmpty) {
  Get.snackbar(
    "", // نخليه فاضي لأننا بنستخدم titleText و messageText
    "",
    titleText: const Text(
      "تنبيه",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
       color: Color.fromARGB(255, 6, 50, 9), 
      ),
    ),
    messageText: const Text(
      "السلة فارغة",
      style: TextStyle(
        fontSize: 18,
      color: Color.fromARGB(255, 6, 50, 9),
      ),
    ),
    snackPosition: SnackPosition.TOP,
    backgroundGradient: LinearGradient(
      colors: [
         Color(0xFFDFFFD6), // أخضر باهت (Pastel green)
        Color(0xFFB5EAD7), // Mint هادئ
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    icon: const Icon(Icons.eco, color: Color.fromARGB(255, 6, 50, 9), size: 30),
    shouldIconPulse: true,
    duration: const Duration(seconds: 3),
    barBlur: 15,
    overlayBlur: 1,
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );


     }else {
      Get.toNamed(AppRoutes.checkout , arguments: {
        "couponid" : couponid ?? "0" , 
        "priceorder" : priceorders.toString() ,
        "discountcoupon" : discountcoupon.toString()
      }) ;
    }
      
  }

  resetVarCart() {
    priceorders = 0.0;
    totalCountItems = 0;
    data.clear();
  }

  refreshPageCart() {
    resetVarCart();
    view();
  }

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addtocart(
      myServices.sharedPreferences.getInt("id").toString(),
      itemsid,
    );
    print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        // data.addAll(response['data']);
        Get.rawSnackbar(
          title: "اشعار",
          messageText: Text("تم اضافة المنتج الى السلة "),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deletfromcart(
      myServices.sharedPreferences.getInt("id").toString(),
      itemsid,
    );
    print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: Text("تم حذف المنتج من االسلة "),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update(); // يظهر اللودينج

    var response = await cartData.viewcart(
      myServices.sharedPreferences.getInt("id").toString(),
    );
    print(response);

    // تحديث الحالة بعد المعالجة
    statusRequest = await handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['cartdata']['status'] == "success") {
          List dataresponse = response['cartdata']['data'];
          Map dataresponsepricecount = response['pricecount'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalCountItems = int.parse(
            dataresponsepricecount['totalcountitems'],
          );
          priceorders =
              (dataresponsepricecount['totalprice'] as num).toDouble();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    // انتظر نصف ثانية قبل تحديث الـ UI النهائي
    await Future.delayed(const Duration(milliseconds: 1000));
    update();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    super.onInit();
  }
}
