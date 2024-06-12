class UpdateProfileResponse {
  dynamic id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  dynamic shopId;
  Profile? profile;
  List<Address>? address;
  dynamic shop;
  dynamic managedShop;
  bool? emailVerified;
  List<Permissions>? permissions;

  UpdateProfileResponse({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.isActive, this.shopId, this.profile, this.address, this.shop, this.managedShop, this.emailVerified, this.permissions,});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    shopId = json['shop_id'];
    profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) { address!.add(new Address.fromJson(v)); });
    }
    shop = json['shop'];
    managedShop = json['managed_shop'];
    emailVerified = json['email_verified'];
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) { permissions!.add(new Permissions.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['shop_id'] = this.shopId;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.map((v) => v.toJson()).toList();
    }
    data['shop'] = this.shop;
    data['managed_shop'] = this.managedShop;
    data['email_verified'] = this.emailVerified;
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profile {
  dynamic id;
  Avatar? avatar;
  String? bio;
  List<Socials>? socials;
  String? contact;
  dynamic notifications;
  dynamic customerId;
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

class Address {
  dynamic id;
  String? title;
  String? type;
  int? default2;
  Address3? address;
  dynamic location;
  dynamic customerId;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id, this.title, this.type, this.default2, this.address, this.location, this.customerId, this.createdAt, this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    default2 = json['default'];
    address =
    json['address'] != null ? new Address3.fromJson(json['address']) : null;
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
  data['default'] = this.default2;
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

class Address3 {
  String? state;
  String? zip;
  String? city;
  String? streetAddress;
  String? country;

  Address3({this.state, this.zip, this.city, this.streetAddress, this.country});

  Address3.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    zip = json['zip'];
    city = json['city'];
    streetAddress = json['street_address'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['street_address'] = this.streetAddress;
    data['country'] = this.country;
    return data;
  }
}

class Permissions {
  dynamic id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Permissions({this.id, this.name, this.guardName, this.createdAt, this.updatedAt, this.pivot});

  Permissions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? modelId;
  int? permissionId;
  String? modelType;

  Pivot({this.modelId, this.permissionId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json['model_id'];
    permissionId = json['permission_id'];
    modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_id'] = this.modelId;
    data['permission_id'] = this.permissionId;
    data['model_type'] = this.modelType;
    return data;
  }
}