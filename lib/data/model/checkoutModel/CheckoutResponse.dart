class CheckoutResponse {
  dynamic totalTax;
  int? shippingCharge;
  List<int>? unavailableProducts;
  int? walletAmount;
  int? walletCurrency;

  CheckoutResponse(
      {this.totalTax,
        this.shippingCharge,
        this.unavailableProducts,
        this.walletAmount,
        this.walletCurrency});

  CheckoutResponse.fromJson(Map<String, dynamic> json) {
    totalTax = json['total_tax'];
    shippingCharge = json['shipping_charge'];
    unavailableProducts = json['unavailable_products'].cast<int>();
    walletAmount = json['wallet_amount'];
    walletCurrency = json['wallet_currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_tax'] = this.totalTax;
    data['shipping_charge'] = this.shippingCharge;
    data['unavailable_products'] = this.unavailableProducts;
    data['wallet_amount'] = this.walletAmount;
    data['wallet_currency'] = this.walletCurrency;
    return data;
  }
}