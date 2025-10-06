


import 'package:bloomy/core/class/crud.dart';
import 'package:bloomy/linkapi.dart';

class PendingOrdersData {
  PendingOrdersData(this.crud);
  Crud crud;
  getData(String usersid) async {
    var response = await crud.postData(linkApi.linkpendingorders, {
      "usersid": usersid.toString(),
    });
    print(
      "Orders==============================================================",
    );
    print(
      "======================={$response}=====================================",
    );
    return response.fold((l) => l, (r) => r);
  }
  deleteData(String orderid) async {
    var response = await crud.postData(linkApi.linkdeleteorders, {
      "id": orderid.toString(),
    });
    print(
      "Orders==============================================================",
    );
    print(
      "======================={$response}=====================================",
    );
    return response.fold((l) => l, (r) => r);
  }
}

