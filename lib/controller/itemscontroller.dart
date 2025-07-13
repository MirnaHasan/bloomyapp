import 'package:bloomy/core/class/statusrequest.dart';
import 'package:bloomy/core/constant/approutes.dart';
import 'package:bloomy/core/functions/handlingdata.dart';
import 'package:bloomy/core/services/services.dart';
import 'package:bloomy/data/datasourse/remote/itemsdata.dart';
import 'package:bloomy/data/model/items.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  chaneCategory(int val, String cateval);
  getItems(String categoryid);
  goToProductDetails (ItemsModel itemsModel);
}

class ItemscontrollerImp extends ItemsController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  List categories = [];
  int? selectedCategory;
  late String cateid;
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCategory = Get.arguments['selectedcategory'];
    cateid = Get.arguments['categoryid'];
    getItems(cateid);
  }

  @override
  chaneCategory(val, cateval) {
    selectedCategory = val;
    cateid = cateval;
    getItems(cateid);
    update();
  }

  @override
  getItems(categoryid) async {
     data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(categoryid , myServices.sharedPreferences.getString("id")! );
    print(response);
    statusRequest = await handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToProductDetails(ItemsModel itemsModel) {
  Get.toNamed(AppRoutes.productdetails , arguments: {
    "itemsmodel" : itemsModel 
  });
  }
}
 

