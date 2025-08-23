

class AddressModel {
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLong;
  double? addressLat;

  AddressModel(
      {this.addressId,
      this.addressName,
      this.addressUsersid,
      this.addressCity,
      this.addressStreet,
      this.addressLong,
      this.addressLat});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLong = json['address_long'];
    addressLat = json['address_lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_long'] = this.addressLong;
    data['address_lat'] = this.addressLat;
    return data;
  }
}