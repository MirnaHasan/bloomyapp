class AddressModel {
  int? addressId;
  String? addressName;
  int? addressUsersid;
  String? addressCity;
  String? addressStreet;
  double? addressLong;
  double? addressLat;

  AddressModel({
    this.addressId,
    this.addressName,
    this.addressUsersid,
    this.addressCity,
    this.addressStreet,
    this.addressLong,
    this.addressLat,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressId: json['address_id'],
      addressName: json['address_name'],
      addressUsersid: json['address_usersid'],
      addressCity: json['address_city'],
      addressStreet: json['address_street'],
      addressLong: json['address_long'] != null
          ? double.parse(json['address_long'].toString())
          : null,
      addressLat: json['address_lat'] != null
          ? double.parse(json['address_lat'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_id': addressId,
      'address_name': addressName,
      'address_usersid': addressUsersid,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_long': addressLong,
      'address_lat': addressLat,
    };
  }
}