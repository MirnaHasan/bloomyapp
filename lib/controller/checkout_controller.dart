import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/address/addressdata.dart';
import 'package:bloomy/data/datasourse/remote/checkoutdata.dart';
import 'package:bloomy/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  final CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));
  final AddressData addressData = Get.put(AddressData(Get.find()));
  final MyServices myServices = Get.find();

  String? paymentMethod;
  String? deliveryType;
  String addressId = "0";
  late String couponid;
  late String priceorder;

  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> data = [];

  // ==================== Helpers ====================
  void _showSnackbar({
    required String title,
    required String message,
    IconData icon = Icons.eco,
  }) {
    Get.snackbar(
      "", "",
      titleText: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color.fromARGB(255, 6, 50, 9),
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 6, 50, 9),
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundGradient: const LinearGradient(
        colors: [Color(0xFFDFFFD6), Color(0xFFB5EAD7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      icon: Icon(icon, color: const Color.fromARGB(255, 6, 50, 9), size: 30),
      shouldIconPulse: true,
      duration: const Duration(seconds: 3),
      barBlur: 15,
      overlayBlur: 1,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  // ==================== Setters ====================
  void chossePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  void chossedeliveryType(String val) {
    deliveryType = val;
    update();
  }

  void chosseShippingAddress(String val) {
    addressId = val;
    update();
  }

  // ==================== API Calls ====================
  Future<void> getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    final response =
        await addressData.viewaddress(myServices.sharedPreferences.getInt("id").toString());

    // نضمن ظهور اللودينغ على الأقل ثانية
    await Future.delayed(const Duration(seconds: 1));

    statusRequest = await handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List shippingAddressData = response['data'];
        data.addAll(shippingAddressData.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future<void> checkOut() async {
    if (paymentMethod == null) {
      return _showSnackbar(title: "تنبيه", message: "Choose payment method");
    }
    if (deliveryType == null) {
      return _showSnackbar(title: "تنبيه", message: "Choose order delivery type");
    }

    statusRequest = StatusRequest.loading;
    update();

    final checkoutdata = {
      "usersid": myServices.sharedPreferences.getInt("id").toString(),
      "addressid": addressId,
      "ordertype": deliveryType!,
      "orderpayment": paymentMethod!,
      "couponid": couponid,
      "orderprice": priceorder,
      "orderpricedelivery": "10",
    };

    final response = await checkOutData.checkout(checkoutdata);

    // نضمن ظهور اللودينغ على الأقل ثانية
    await Future.delayed(const Duration(seconds: 1));

    statusRequest = await handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homepage);
        _showSnackbar(title: "تنبيه", message: "The product was ordered successfully");
      } else {
        statusRequest = StatusRequest.none;
        _showSnackbar(
          title: "تنبيه",
          message: "Try Again",
          icon: Icons.error_outline_outlined,
        );
      }
    }
    update();
  }

  // ==================== Lifecycle ====================
  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    getShippingAddress();
    super.onInit();
  }
}
