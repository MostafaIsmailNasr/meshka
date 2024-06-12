class AddressResponse {
  String? title;
  String? type;
  bool? default2;
  int? customerId;
  Address? address;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddressResponse({this.title, this.type, this.default2, this.customerId, this.address, this.updatedAt, this.createdAt, this.id});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    type = json['type'];
    default2 = json['default'];
    customerId = json['customer_id'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['title'] = this.title;
  data['type'] = this.type;
  data['default'] = this.default2;
  data['customer_id'] = this.customerId;
  if (this.address != null) {
  data['address'] = this.address!.toJson();
  }
  data['updated_at'] = this.updatedAt;
  data['created_at'] = this.createdAt;
  data['id'] = this.id;
  return data;
}
}

class Address {
  String? country;
  String? state;
  String? zip;
  String? city;
  String? streetAddress;

  Address({this.country, this.state, this.zip, this.city, this.streetAddress});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    state = json['state'];
    zip = json['zip'];
    city = json['city'];
    streetAddress = json['street_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['street_address'] = this.streetAddress;
    return data;
  }
}