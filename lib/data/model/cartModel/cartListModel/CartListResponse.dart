class CartListResponse {
  bool? success;
  List<CartItems>? cartItem;
  int? cartCount;
  double? taxAmount;
  int? totalAmount;

  CartListResponse(
      {this.success,
        this.cartItem,
        this.cartCount,
        this.taxAmount,
        this.totalAmount});

  CartListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['cartItems'] != null) {
      cartItem = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItem!.add(new CartItems.fromJson(v));
      });
    }
    cartCount = json['cartCount'];
    taxAmount = json['taxAmount'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.cartItem != null) {
      data['cartItems'] = this.cartItem!.map((v) => v.toJson()).toList();
    }
    data['cartCount'] = this.cartCount;
    data['taxAmount'] = this.taxAmount;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class CartItems {
  int? cartItemId;
  int? cartId;
  int? productId;
  String? sku;
  String? name;
  int? quantity;
  int? price;
  Image? image;
  List<Options>? options;
  int? subtotal;
  dynamic variationId;

  CartItems(
      {this.cartItemId,
        this.cartId,
        this.productId,
        this.sku,
        this.name,
        this.quantity,
        this.price,
        this.image,
        this.options,
        this.subtotal,
        this.variationId});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cart_item_id'];
    cartId = json['cart_id'];
    productId = json['product_id'];
    sku = json['sku'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
    variationId =json['variationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_item_id'] = this.cartItemId;
    data['cart_id'] = this.cartId;
    data['product_id'] = this.productId;
    data['sku'] = this.sku;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = this.subtotal;
    data['variationId']=this.variationId;
    return data;
  }
}

class Image {
  String? thumbnail;
  String? original;
  int? id;
  String? fileName;

  Image({this.thumbnail, this.original, this.id, this.fileName});

  Image.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    original = json['original'];
    id = json['id'];
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['original'] = this.original;
    data['id'] = this.id;
    data['file_name'] = this.fileName;
    return data;
  }
}

class Options {
  String? name;
  String? value;

  Options({this.name, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}