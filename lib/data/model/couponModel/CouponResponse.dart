class CouponResponse {
  bool? isValid;
  Coupon? coupon;

  CouponResponse({this.isValid, this.coupon});

  CouponResponse.fromJson(Map<String, dynamic> json) {
    isValid = json['is_valid'];
    coupon =
    json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_valid'] = this.isValid;
    if (this.coupon != null) {
      data['coupon'] = this.coupon!.toJson();
    }
    return data;
  }
}

class Coupon {
  int? id;
  String? code;
  String? language;
  Null? description;
  Image? image;
  String? type;
  int? amount;
  int? minimumCartAmount;
  String? activeFrom;
  String? expireAt;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  bool? isValid;
  List<String>? translatedLanguages;

  Coupon(
      {this.id,
        this.code,
        this.language,
        this.description,
        this.image,
        this.type,
        this.amount,
        this.minimumCartAmount,
        this.activeFrom,
        this.expireAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.isValid,
        this.translatedLanguages});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    language = json['language'];
    description = json['description'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    type = json['type'];
    amount = json['amount'];
    minimumCartAmount = json['minimum_cart_amount'];
    activeFrom = json['active_from'];
    expireAt = json['expire_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isValid = json['is_valid'];
    translatedLanguages = json['translated_languages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['language'] = this.language;
    data['description'] = this.description;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['minimum_cart_amount'] = this.minimumCartAmount;
    data['active_from'] = this.activeFrom;
    data['expire_at'] = this.expireAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_valid'] = this.isValid;
    data['translated_languages'] = this.translatedLanguages;
    return data;
  }
}

class Image {
  int? id;
  String? original;
  String? thumbnail;

  Image({this.id, this.original, this.thumbnail});

  Image.fromJson(Map<String, dynamic> json) {
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