class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  num? ordersPricedelivery; // ممكن يكون int أو double
  num? ordersPrice;
  num? ordersTotalprice;
  String? ordersCoupon; // Null? غير مستخدمة، نستخدم String? بدلها
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? ordersRating;
  String? ordersNoterating;
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLong;
  double? addressLat;

  OrdersModel({
    this.ordersId,
    this.ordersUsersid,
    this.ordersAddress,
    this.ordersType,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersTotalprice,
    this.ordersCoupon,
    this.ordersPaymentmethod,
    this.ordersStatus,
    this.ordersDatetime,
    this.ordersRating,
    this.ordersNoterating,
    this.addressId,
    this.addressName,
    this.addressUsersid,
    this.addressCity,
    this.addressStreet,
    this.addressLong,
    this.addressLat,
  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];

    // نستخدم as num? لضمان التحويل السليم سواء Int أو Double
    ordersPricedelivery = (json['orders_pricedelivery'] as num?) ?? 0;
    ordersPrice = (json['orders_price'] as num?) ?? 0;
    ordersTotalprice = (json['orders_totalprice'] as num?) ?? 0;

    ordersCoupon = json['orders_coupon']?.toString();
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];

    // نحول longitude و latitude إلى double بشكل آمن
    addressLong = (json['address_long'] != null)
        ? (json['address_long'] as num).toDouble()
        : null;
    addressLat = (json['address_lat'] != null)
        ? (json['address_lat'] as num).toDouble()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_usersid'] = addressUsersid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_long'] = addressLong;
    data['address_lat'] = addressLat;
    return data;
  }
}
