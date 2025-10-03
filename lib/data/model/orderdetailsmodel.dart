class OrdersDetailsModel {
  int? itemsprice;      // الاجمالي (من SUM في الـ View)
  int? countitems;      // عدد القطع
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsActive;
  int? itemsCount;
  double? itemsPrice;   // السعر الأصلي (من الجدول items)
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;

  OrdersDetailsModel ({
    this.itemsprice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsActive,
    this.itemsCount,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
  });

  OrdersDetailsModel .fromJson(Map<String, dynamic> json) {
    itemsprice   = json['itemsprice']; // مهم: هاد اللي كان ناقص
    countitems   = json['countitems'];
    cartId       = json['cart_id'];
    cartUsersid  = json['cart_usersid'];
    cartItemsid  = json['cart_itemsid'];
    itemsId      = json['items_id'];
    itemsName    = json['items_name'];
    itemsNameAr  = json['items_name_ar'];
    itemsDesc    = json['items_desc'];
    itemsDescAr  = json['items_desc_ar'];
    itemsImage   = json['items_image'];
    itemsActive  = json['items_active'];
    itemsCount   = json['items_count'];
    itemsPrice   = (json['items_price'] as num?)?.toDouble();
    itemsDiscount= json['items_discount'];
    itemsDate    = json['items_date'];
    itemsCat     = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['itemsprice']     = itemsprice;
    data['countitems']     = countitems;
    data['cart_id']        = cartId;
    data['cart_usersid']   = cartUsersid;
    data['cart_itemsid']   = cartItemsid;
    data['items_id']       = itemsId;
    data['items_name']     = itemsName;
    data['items_name_ar']  = itemsNameAr;
    data['items_desc']     = itemsDesc;
    data['items_desc_ar']  = itemsDescAr;
    data['items_image']    = itemsImage;
    data['items_active']   = itemsActive;
    data['items_count']    = itemsCount;
    data['items_price']    = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date']     = itemsDate;
    data['items_cat']      = itemsCat;
    return data;
  }
}