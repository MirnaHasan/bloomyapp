// class PendingOrdersModel {
//   int? ordersId;
//   int? ordersUsersid;
//   int? ordersType;
//   double? ordersPricedelivery;
//   double? ordersPrice;
//   String? ordersDatetime;
//   int? ordersCoupon;
//   int? ordersPaymentmethod;
//   double? ordersTotalprice;
//   int? ordersStatus;
//   int? ordersAddress;
//   int? addressId;
//   String? addressName;
//   int? addressUsersid;
//   String? addressCity;
//   String? addressStreet;
//   double? addressLong;
//   double? addressLat;

//   PendingOrdersModel({
//     this.ordersId,
//     this.ordersUsersid,
//     this.ordersType,
//     this.ordersPricedelivery,
//     this.ordersPrice,
//     this.ordersDatetime,
//     this.ordersCoupon,
//     this.ordersPaymentmethod,
//     this.ordersTotalprice,
//     this.ordersStatus,
//     this.ordersAddress,
//     this.addressId,
//     this.addressName,
//     this.addressUsersid,
//     this.addressCity,
//     this.addressStreet,
//     this.addressLong,
//     this.addressLat,
//   });

//   factory PendingOrdersModel.fromJson(Map<String, dynamic> json) {
//     return PendingOrdersModel(
//       ordersId: json['orders_id'],
//       ordersUsersid: json['orders_usersid'],
//       ordersType: json['orders_type'],
//       ordersPricedelivery: json['orders_pricedelivery'] != null
//           ? double.parse(json['orders_pricedelivery'].toString())
//           : null,
//       ordersPrice: json['orders_price'] != null
//           ? double.parse(json['orders_price'].toString())
//           : null,
//       ordersDatetime: json['orders_datetime'],
//       ordersCoupon: json['orders_coupon'],
//       ordersPaymentmethod: json['orders_paymentmethod'],
//       ordersTotalprice: json['orders_totalprice'] != null
//           ? double.parse(json['orders_totalprice'].toString())
//           : null,
//       ordersStatus: json['orders_status'],
//       ordersAddress: json['orders_address'],
//       addressId: json['address_id'],
//       addressName: json['address_name'],
//       addressUsersid: json['address_usersid'],
//       addressCity: json['address_city'],
//       addressStreet: json['address_street'],
//       addressLong: json['address_long'] != null
//           ? double.parse(json['address_long'].toString())
//           : null,
//       addressLat: json['address_lat'] != null
//           ? double.parse(json['address_lat'].toString())
//           : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'orders_id': ordersId,
//       'orders_usersid': ordersUsersid,
//       'orders_type': ordersType,
//       'orders_pricedelivery': ordersPricedelivery,
//       'orders_price': ordersPrice,
//       'orders_datetime': ordersDatetime,
//       'orders_coupon': ordersCoupon,
//       'orders_paymentmethod': ordersPaymentmethod,
//       'orders_totalprice': ordersTotalprice,
//       'orders_status': ordersStatus,
//       'orders_address': ordersAddress,
//       'address_id': addressId,
//       'address_name': addressName,
//       'address_usersid': addressUsersid,
//       'address_city': addressCity,
//       'address_street': addressStreet,
//       'address_long': addressLong,
//       'address_lat': addressLat,
//     };
//   }
// }

