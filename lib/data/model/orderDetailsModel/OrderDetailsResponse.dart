class OrderDetailsResponse {
  int? id;
  String? trackingNumber;
  int? customerId;
  String? customerContact;
  String? customerName;
  int? amount;
  dynamic salesTax;
  dynamic paidTotal;
  dynamic total;
  dynamic note;
  String? cancelledAmount;
  String? cancelledTax;
  String? cancelledDeliveryFee;
  String? language;
  dynamic couponId;
  dynamic parentId;
  dynamic shopId;
  int? discount;
  String? paymentGateway;
  dynamic alteredPaymentGateway;
  ShippingAddress? shippingAddress;
  ShippingAddress? billingAddress;
  dynamic logisticsProvider;
  int? deliveryFee;
  String? deliveryTime;
  String? orderStatus;
  String? paymentStatus;
  String? createdAt;
  Customer? customer;
  List<Products>? products;
  dynamic walletPoint;

  OrderDetailsResponse(
      {this.id,
        this.trackingNumber,
        this.customerId,
        this.customerContact,
        this.customerName,
        this.amount,
        this.salesTax,
        this.paidTotal,
        this.total,
        this.note,
        this.cancelledAmount,
        this.cancelledTax,
        this.cancelledDeliveryFee,
        this.language,
        this.couponId,
        this.parentId,
        this.shopId,
        this.discount,
        this.paymentGateway,
        this.alteredPaymentGateway,
        this.shippingAddress,
        this.billingAddress,
        this.logisticsProvider,
        this.deliveryFee,
        this.deliveryTime,
        this.orderStatus,
        this.paymentStatus,
        this.createdAt,
        this.customer,
        this.products,
        this.walletPoint});

  OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackingNumber = json['tracking_number'];
    customerId = json['customer_id'];
    customerContact = json['customer_contact'];
    customerName = json['customer_name'];
    amount = json['amount'];
    salesTax = json['sales_tax'];
    paidTotal = json['paid_total'];
    total = json['total'];
    note = json['note'];
    cancelledAmount = json['cancelled_amount'];
    cancelledTax = json['cancelled_tax'];
    cancelledDeliveryFee = json['cancelled_delivery_fee'];
    language = json['language'];
    couponId = json['coupon_id'];
    parentId = json['parent_id'];
    shopId = json['shop_id'];
    discount = json['discount'];
    paymentGateway = json['payment_gateway'];
    alteredPaymentGateway = json['altered_payment_gateway'];
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
    billingAddress = json['billing_address'] != null
        ? new ShippingAddress.fromJson(json['billing_address'])
        : null;
    logisticsProvider = json['logistics_provider'];
    deliveryFee = json['delivery_fee'];
    deliveryTime = json['delivery_time'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    walletPoint = json['wallet_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tracking_number'] = this.trackingNumber;
    data['customer_id'] = this.customerId;
    data['customer_contact'] = this.customerContact;
    data['customer_name'] = this.customerName;
    data['amount'] = this.amount;
    data['sales_tax'] = this.salesTax;
    data['paid_total'] = this.paidTotal;
    data['total'] = this.total;
    data['note'] = this.note;
    data['cancelled_amount'] = this.cancelledAmount;
    data['cancelled_tax'] = this.cancelledTax;
    data['cancelled_delivery_fee'] = this.cancelledDeliveryFee;
    data['language'] = this.language;
    data['coupon_id'] = this.couponId;
    data['parent_id'] = this.parentId;
    data['shop_id'] = this.shopId;
    data['discount'] = this.discount;
    data['payment_gateway'] = this.paymentGateway;
    data['altered_payment_gateway'] = this.alteredPaymentGateway;
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    data['logistics_provider'] = this.logisticsProvider;
    data['delivery_fee'] = this.deliveryFee;
    data['delivery_time'] = this.deliveryTime;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['wallet_point'] = this.walletPoint;
    return data;
  }
}

class ShippingAddress {
  String? zip;
  String? city;
  String? state;
  String? country;
  String? streetAddress;

  ShippingAddress(
      {this.zip, this.city, this.state, this.country, this.streetAddress});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    zip = json['zip'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    streetAddress = json['street_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zip'] = this.zip;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['street_address'] = this.streetAddress;
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  dynamic shopId;
  bool? emailVerified;

  Customer(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.shopId,
        this.emailVerified});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    shopId = json['shop_id'];
    emailVerified = json['email_verified'];
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
    data['email_verified'] = this.emailVerified;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? slug;
  String? description;
  int? typeId;
  int? price;
  int? shopId;
  int? salePrice;
  String? language;
  int? minPrice;
  int? maxPrice;
  String? sku;
  int? quantity;
  int? inStock;
  int? isTaxable;
  dynamic shippingClassId;
  String? status;
  String? productType;
  String? unit;
  dynamic height;
  dynamic width;
  dynamic length;
  Gallery? image;
  dynamic video;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? authorId;
  int? manufacturerId;
  int? isDigital;
  int? isExternal;
  dynamic externalProductUrl;
  dynamic externalProductButtonText;
  int? ratings;
  int? totalReviews;
  dynamic myReview;
  bool? inWishlist;
  List<String>? translatedLanguages;
  Pivot? pivot;

  Products(
      {this.id,
        this.name,
        this.slug,
        this.description,
        this.typeId,
        this.price,
        this.shopId,
        this.salePrice,
        this.language,
        this.minPrice,
        this.maxPrice,
        this.sku,
        this.quantity,
        this.inStock,
        this.isTaxable,
        this.shippingClassId,
        this.status,
        this.productType,
        this.unit,
        this.height,
        this.width,
        this.length,
        this.image,
        this.video,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.authorId,
        this.manufacturerId,
        this.isDigital,
        this.isExternal,
        this.externalProductUrl,
        this.externalProductButtonText,
        this.ratings,
        this.totalReviews,
        this.myReview,
        this.inWishlist,
        this.translatedLanguages,
        this.pivot,});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    typeId = json['type_id'];
    price = json['price'];
    shopId = json['shop_id'];
    salePrice = json['sale_price'];
    language = json['language'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    sku = json['sku'];
    quantity = json['quantity'];
    inStock = json['in_stock'];
    isTaxable = json['is_taxable'];
    shippingClassId = json['shipping_class_id'];
    status = json['status'];
    productType = json['product_type'];
    unit = json['unit'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    image = json['image'] != null ? new Gallery.fromJson(json['image']) : null;
    video = json['video'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    authorId = json['author_id'];
    manufacturerId = json['manufacturer_id'];
    isDigital = json['is_digital'];
    isExternal = json['is_external'];
    externalProductUrl = json['external_product_url'];
    externalProductButtonText = json['external_product_button_text'];
    ratings = json['ratings'];
    totalReviews = json['total_reviews'];
    myReview = json['my_review'];
    inWishlist = json['in_wishlist'];
    translatedLanguages = json['translated_languages'].cast<String>();
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['type_id'] = this.typeId;
    data['price'] = this.price;
    data['shop_id'] = this.shopId;
    data['sale_price'] = this.salePrice;
    data['language'] = this.language;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    data['sku'] = this.sku;
    data['quantity'] = this.quantity;
    data['in_stock'] = this.inStock;
    data['is_taxable'] = this.isTaxable;
    data['shipping_class_id'] = this.shippingClassId;
    data['status'] = this.status;
    data['product_type'] = this.productType;
    data['unit'] = this.unit;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['author_id'] = this.authorId;
    data['manufacturer_id'] = this.manufacturerId;
    data['is_digital'] = this.isDigital;
    data['is_external'] = this.isExternal;
    data['external_product_url'] = this.externalProductUrl;
    data['external_product_button_text'] = this.externalProductButtonText;
    data['ratings'] = this.ratings;
    data['total_reviews'] = this.totalReviews;
    data['my_review'] = this.myReview;
    data['in_wishlist'] = this.inWishlist;
    data['translated_languages'] = this.translatedLanguages;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Gallery {
  int? id;
  String? original;
  String? thumbnail;

  Gallery({this.id, this.original, this.thumbnail});

  Gallery.fromJson(Map<String, dynamic> json) {
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

class Pivot {
  int? orderId;
  int? productId;
  String? orderQuantity;
  int? unitPrice;
  int? subtotal;
  dynamic variationOptionId;
  String? createdAt;
  String? updatedAt;

  Pivot(
      {this.orderId,
        this.productId,
        this.orderQuantity,
        this.unitPrice,
        this.subtotal,
        this.variationOptionId,
        this.createdAt,
        this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productId = json['product_id'];
    orderQuantity = json['order_quantity'];
    unitPrice = json['unit_price'];
    subtotal = json['subtotal'];
    variationOptionId = json['variation_option_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['order_quantity'] = this.orderQuantity;
    data['unit_price'] = this.unitPrice;
    data['subtotal'] = this.subtotal;
    data['variation_option_id'] = this.variationOptionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}