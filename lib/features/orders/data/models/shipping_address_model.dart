class ShippingAddressModel {
  final String? phone;
  final String? city;
  final String? details;

  ShippingAddressModel({
    this.phone,
    this.city,
    this.details,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      ShippingAddressModel(
        phone: json['phone'],
        city: json['city'],
        details: json['details'],
      );
}


