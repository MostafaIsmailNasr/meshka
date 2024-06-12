class AddToCartResponse {
  bool? success;
  int? cartId;

  AddToCartResponse({this.success, this.cartId});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    cartId = json['cart_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['cart_id'] = this.cartId;
    return data;
  }
}