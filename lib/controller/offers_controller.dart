import 'package:bloomy/controller/homecontroller.dart';
import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/data/datasourse/remote/offers_data.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OffersController extends MixSearchController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  /// 🔹 جلب بيانات العروض من الخادم
  Future<void> getDataFromDatabase() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await offersData.getData();
    print("Offers Response => $response");

    statusRequest = await handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listData2 = response['data'];
        data = listData2.map((e) => ItemsModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  /// 🔹 تحديث البيانات بشكل يدوي (pull-to-refresh)
  Future<void> refreshOffers() async {
    await getDataFromDatabase();
  }

  @override
  void onInit() {
    search = TextEditingController() ;
    getDataFromDatabase();
    super.onInit();
  }
}

  
