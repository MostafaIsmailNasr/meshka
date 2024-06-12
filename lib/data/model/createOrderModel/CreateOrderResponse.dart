class CreateOrderResponse {
  String? trackingNumber;
  int? customerId;
  String? language;
  String? orderStatus;
  String? paymentStatus;
  int? amount;
  dynamic salesTax;
  dynamic paidTotal;
  dynamic total;
  String? deliveryTime;
  String? paymentGateway;
  int? discount;
  dynamic couponId;
  BillingAddress? billingAddress;
  BillingAddress? shippingAddress;
  int? deliveryFee;
  String? customerContact;
  String? customerName;
  String? createdAt;
  int? id;

  CreateOrderResponse(
      {this.trackingNumber,
        this.customerId,
        this.language,
        this.orderStatus,
        this.paymentStatus,
        this.amount,
        this.salesTax,
        this.paidTotal,
        this.total,
        this.deliveryTime,
        this.paymentGateway,
        this.discount,
        this.couponId,
        this.billingAddress,
        this.shippingAddress,
        this.deliveryFee,
        this.customerContact,
        this.customerName,
        this.createdAt,
        this.id});

  CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    trackingNumber = json['tracking_number'];
    customerId = json['customer_id'];
    language = json['language'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    amount = json['amount'];
    salesTax = json['sales_tax'];
    paidTotal = json['paid_total'];
    total = json['total'];
    deliveryTime = json['delivery_time'];
    paymentGateway = json['payment_gateway'];
    discount = json['discount'];
    couponId = json['coupon_id'];
    billingAddress = json['billing_address'] != null
        ? new BillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new BillingAddress.fromJson(json['shipping_address'])
        : null;
    deliveryFee = json['delivery_fee'];
    customerContact = json['customer_contact'];
    customerName = json['customer_name'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_number'] = this.trackingNumber;
    data['customer_id'] = this.customerId;
    data['language'] = this.language;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['amount'] = this.amount;
    data['sales_tax'] = this.salesTax;
    data['paid_total'] = this.paidTotal;
    data['total'] = this.total;
    data['delivery_time'] = this.deliveryTime;
    data['payment_gateway'] = this.paymentGateway;
    data['discount'] = this.discount;
    data['coupon_id'] = this.couponId;
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    data['delivery_fee'] = this.deliveryFee;
    data['customer_contact'] = this.customerContact;
    data['customer_name'] = this.customerName;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class BillingAddress {
  String? country;
  String? city;
  String? state;
  String? zip;
  String? streetAddress;

  BillingAddress(
      {this.country, this.city, this.state, this.zip, this.streetAddress});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    streetAddress = json['street_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['street_address'] = this.streetAddress;
    return data;
  }
}