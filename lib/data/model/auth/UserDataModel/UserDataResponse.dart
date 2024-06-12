class UserDataResponse {
  int? id;
  String? name;
  String? email;
  int? cartId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  dynamic shopId;
  bool? emailVerified;
  Profile? profile;
  Wallet? wallet;
  List<Address>? address;
  dynamic managedShop;

  UserDataResponse({this.id, this.name, this.email,this.cartId, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.isActive, this.shopId, this.emailVerified, this.profile, this.wallet, this.address, this.managedShop});

  UserDataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    cartId= json['cart_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    shopId = json['shop_id'];
    emailVerified = json['email_verified'];
    profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    wallet = json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) { address!.add(new Address.fromJson(v)); });
    }
    managedShop = json['managed_shop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['cart_id'] = this.cartId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['shop_id'] = this.shopId;
    data['email_verified'] = this.emailVerified;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    data['managed_shop'] = this.managedShop;
    return data;
  }
}

class Profile {
  int? id;
  Avatar? avatar;
  String? bio;
  List<Socials>? socials;
  String? contact;
  dynamic notifications;
  int? customerId;
  String? createdAt;
  String? updatedAt;

  Profile({this.id, this.avatar, this.bio, this.socials, this.contact, this.notifications, this.customerId, this.createdAt, this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    bio = json['bio'];
    if (json['socials'] != null) {
      socials = <Socials>[];
      json['socials'].forEach((v) { socials!.add(new Socials.fromJson(v)); });
    }
    contact = json['contact'];
    notifications = json['notifications'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    data['bio'] = this.bio;
    if (this.socials != null) {
      data['socials'] = this.socials!.map((v) => v.toJson()).toList();
    }
    data['contact'] = this.contact;
    data['notifications'] = this.notifications;
    data['customer_id'] = this.customerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Avatar {
  dynamic id;
  String? original;
  String? thumbnail;

  Avatar({this.id, this.original, this.thumbnail});

  Avatar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    original = json['original'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original'] = this.original;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Socials {
  String? type;
  String? link;

  Socials({this.type, this.link});

  Socials.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['link'] = this.link;
    return data;
  }
}

class Wallet {
  int? id;
  int? totalPoints;
  int? pointsUsed;
  int? availablePoints;
  int? customerId;
  String? createdAt;
  String? updatedAt;

  Wallet({this.id, this.totalPoints, this.pointsUsed, this.availablePoints, this.customerId, this.createdAt, this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPoints = json['total_points'];
    pointsUsed = json['points_used'];
    availablePoints = json['available_points'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total_points'] = this.totalPoints;
    data['points_used'] = this.pointsUsed;
    data['available_points'] = this.availablePoints;
    data['customer_id'] = this.customerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Address {
  int? id;
  String? title;
  String? type;
  int? default1;
  Address2? address;
  dynamic location;
  int? customerId;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
      this.title,
      this.type,
      this.default1,
      this.address,
      this.location,
      this.customerId,
      this.createdAt,
      this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    default1 = json['default'];
    address =
        json['address'] != null ? new Address2.fromJson(json['address']) : null;
    location = json['location'];
    customerId = json['customer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['default'] = this.default1;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['location'] = this.location;
    data['customer_id'] = this.customerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Address2 {
  String? country;
  String? state;
  String? zip;
  String? city;
  String? streetAddress;

  Address2({this.country, this.state, this.zip, this.city, this.streetAddress});

  Address2.fromJson(Map<String, dynamic> json) {
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