

class PendingOrdersModel  {
	int? ordersId;
	int? ordersUsersid;
	int? ordersType;
	int? ordersPricedelivery;
	int? ordersPrice;
	String? ordersDatetime;
	int? ordersCoupon;
	int? ordersPaymentmethod;
	double? ordersTotalprice;
	int? ordersStatus;
	int? ordersAddress;

	PendingOrdersModel ({this.ordersId, this.ordersUsersid, this.ordersType, this.ordersPricedelivery, this.ordersPrice, this.ordersDatetime, this.ordersCoupon, this.ordersPaymentmethod, this.ordersTotalprice, this.ordersStatus, this.ordersAddress});

	PendingOrdersModel .fromJson(Map<String, dynamic> json) {
		ordersId = json['orders_id'];
		ordersUsersid = json['orders_usersid'];
		ordersType = json['orders_type'];
		ordersPricedelivery = json['orders_pricedelivery'];
		ordersPrice = json['orders_price'];
		ordersDatetime = json['orders_datetime'];
		ordersCoupon = json['orders_coupon'];
		ordersPaymentmethod = json['orders_paymentmethod'];
		// ordersTotalprice = json['orders_totalprice'];
    ordersTotalprice = (json['orders_totalprice'] as num).toDouble();
		ordersStatus = json['orders_status'];
		ordersAddress = json['orders_address'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['orders_id'] = this.ordersId;
		data['orders_usersid'] = this.ordersUsersid;
		data['orders_type'] = this.ordersType;
		data['orders_pricedelivery'] = this.ordersPricedelivery;
		data['orders_price'] = this.ordersPrice;
		data['orders_datetime'] = this.ordersDatetime;
		data['orders_coupon'] = this.ordersCoupon;
		data['orders_paymentmethod'] = this.ordersPaymentmethod;
		data['orders_totalprice'] = this.ordersTotalprice;
		data['orders_status'] = this.ordersStatus;
		data['orders_address'] = this.ordersAddress;
		return data;
	}
}