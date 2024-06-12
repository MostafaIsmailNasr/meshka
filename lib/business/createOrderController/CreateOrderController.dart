import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mashkah_library/conustant/toast_class.dart';
import '../../conustant/di.dart';
import '../../conustant/my_colors.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/auth/UserDataModel/UserDataResponse.dart';
import '../../data/model/cartModel/cartListModel/CartListResponse.dart';
import '../../data/model/checkoutModel/CheckoutResponse.dart';
import '../../data/model/couponModel/CouponResponse.dart';
import '../../data/model/createOrderModel/CreateOrderResponse.dart';
import '../../data/model/settingModel/SettingResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';
import '../cartController/CartController.dart';
import '../homeController/HomeController.dart';

class CreateOrderController extends GetxController {
  Repo repo = Repo(WebService());
  var addressResponse = UserDataResponse().obs;
  var settingResponse = SettingResponse().obs;
  var checkoutResponse =CheckoutResponse().obs;
  var createOrderResponse =CreateOrderResponse().obs;
  var couponResponse =CouponResponse().obs;
  var isLoading = false.obs;
  var contactNumber="".obs;
  var tax="0".obs;
  var fees="0".obs;
  var discount=0.0.obs;
  var totalPrice =0.0.obs;
  var couponId="".obs;
  var deliverTime="".obs;
  var addAddress=false.obs;
  RxList<dynamic> addressList=[].obs;
  RxList<dynamic> timesList=[].obs;
  RxList<dynamic> unavailableProducts=[].obs;
  RxList<dynamic> productsJson=[].obs;
  Rx<bool> isVisable = false.obs;
  Rx<bool> isVisable2 = false.obs;
  late double lat=30.0622723;
  late double lng=31.3274007;
  ///
  var streetAddress = ''.obs;
  var countryAddress = ''.obs;
  var stateAddress = ''.obs;
  var tittleAddress = ''.obs;
  var zipAddress = ''.obs;
  ///
  TextEditingController codeController = TextEditingController();
  final homeController = Get.put(HomeController());
  final cartController = Get.put(CartController());
  var resultCodeListAddress=0;
  var resultCodeSetting=0;
  var resultCodeCheckOut=0;
  var resultCodeCreateOrder=0;
  TextEditingController phoneController = TextEditingController();
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  getData(BuildContext context)async{
     contactNumber.value=sharedPreferencesService.getString("contact");
      productsJson.value = convertProductListToJson(cartController.cartItem);
      checkout(
          productsJson.value,
          cartController.totalPrice1.value.toString(),
          "null",
          "0",
          cartController.totalPrice1.value.toString(),
          "null",
          "null",
          cartController.totalPrice1.value.toString(),
          "null",
          contactNumber.value??"",
          "CASH_ON_DELIVERY",
          "",
          "",
          "",
          "",
          "",
          "first",context);
    getAddressList();
     getSetting();
  }

  getAddressList() async {
    isLoading.value=true;
    addressResponse.value = await repo.getUserData();
    if(resultCodeListAddress==200){
      isLoading.value = false;
      addressList.value=addressResponse.value.address??[];
      if(addressResponse.value.address!.isEmpty){
        // streetAddress.value=homeController.streetAddress.value;
        // countryAddress.value=homeController.countryAddress.value;
        // tittleAddress.value=homeController.countryAddress.value;
        // zipAddress.value="20";
         streetAddress = ''.obs;
         countryAddress = ''.obs;
         stateAddress = ''.obs;
         tittleAddress = ''.obs;
         zipAddress = ''.obs;
        addAddress.value=true;
      }else{
        streetAddress.value=addressResponse.value.address?[0].address?.streetAddress??"";
        countryAddress.value=addressResponse.value.address?[0].address?.city??"";
        stateAddress.value=addressResponse.value.address?[0].address?.state??"";
        tittleAddress.value=addressResponse.value.address?[0].title??"";
        zipAddress.value=addressResponse.value.address?[0].address?.zip??"";
        addAddress.value=false;
      }
    }
    return addressResponse.value;
  }

  getSetting()async{
    isLoading.value=true;
    settingResponse.value=await repo.getSetting();
    if(resultCodeSetting==200){
      isLoading.value = false;
      timesList.value=settingResponse.value.options?.deliveryTime??[];
      deliverTime.value=settingResponse.value.options?.deliveryTime?[0].title??"";
    }
    return settingResponse.value;
  }

  List convertProductListToJson(List<CartItems> productsList) {
    List<Map<String, dynamic>> productListJson = [];
    productsList.forEach((product) {
      productListJson.add({
        'product_id': product.productId,
        'variation_option_id':product.variationId,
        'order_quantity':product.quantity,
        'unit_price': product.price,
        'subtotal': product.subtotal,
      });
    });
    print(("listt "+jsonEncode(productListJson).toString()));
    return productListJson;//jsonEncode(productListJson);
  }

  checkout(
      List productList,
      String amount,
      String couponId,
      String discount,
      String paidTotal,
      String salesTax,
      String deliveryFee,
      String total,
      String deliveryTime,
      String customerContact,
      String paymentGateway,
      String zip,
      String city,
      String state,
      String country,
      String streetAddress,
      String from,
      BuildContext context
      )async{
    if(from=="first") {
      isLoading.value = true;
    }else{
      isVisable2.value=true;
    }
    checkoutResponse.value=await repo.checkout(
        productList,
        amount,
        couponId,
        discount,
        paidTotal,
        salesTax,
        deliveryFee,
        total,
        deliveryTime,
        customerContact,
        paymentGateway,
        zip,
        city,
        state,
        country,
        streetAddress);
    if(resultCodeCheckOut==200){
      if(from=="first") {
        isLoading.value=false;
      unavailableProducts.value=checkoutResponse.value.unavailableProducts??[];
      tax.value=checkoutResponse.value.totalTax.toString();
      fees.value=checkoutResponse.value.shippingCharge.toString();
      totalPrice.value=(cartController.totalPrice1.value+double.parse(tax.value)+double.parse(fees.value));
      if(unavailableProducts.value.isNotEmpty){
        Fluttertoast.showToast(
            msg: "cant create order",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: MyColors.STATUSEREDColor
        );
      }}else{
        //isVisable2.value=false;
        unavailableProducts.value=checkoutResponse.value.unavailableProducts??[];
        tax.value=checkoutResponse.value.totalTax.toString();
        fees.value=checkoutResponse.value.shippingCharge.toString();
        totalPrice.value=(cartController.totalPrice1.value+double.parse(tax.value)+double.parse(fees.value));
        if(unavailableProducts.value.isNotEmpty){
          isVisable2.value=false;
          Fluttertoast.showToast(
              msg: "cant create order please check cart items",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: MyColors.STATUSEREDColor
          );
        }else{
          createOrder(
            productList,
              amount,
            salesTax,
            couponId,
            paidTotal,
            total,
            deliveryTime,
            customerContact,
            paymentGateway,
            zip,
            city,
            state,
            country,
            streetAddress,
            context
          );
        }
      }
    }
  }

  validateCoupon(BuildContext context)async{
    couponResponse.value=await repo.validateCoupon(
        codeController.text,
        cartController.totalPrice1.value.toString());
    isVisable.value = false;
    if(couponResponse.value.isValid==true){
      couponId.value=couponResponse.value.coupon!.id.toString();
      if((couponResponse.value.coupon?.type=="fixed")
          &&(couponResponse.value.coupon!.amount!.toInt())<=totalPrice.value){
        discount.value=couponResponse.value.coupon!.amount!.toDouble()??0.0;
        var subtotal=cartController.totalPrice1.value-discount.value;
        totalPrice.value=(subtotal+double.parse(tax.value)+double.parse(fees.value));
      }else{
        discount.value=(cartController.totalPrice1.value*((couponResponse.value.coupon!.amount!)/100)) ;
        var subtotal=cartController.totalPrice1.value-discount.value;
        totalPrice.value=(subtotal+double.parse(tax.value)+double.parse(fees.value));
      }
    }else{
      codeController.clear();
      ToastClass.showCustomToast(context, "INVALID COUPON CODE", "error");
    }
  }

  createOrder(
      List productList,
      String amount,
      String salesTax,
      String couponId,
      String paidTotal,
      String total,
      String deliveryTime,
      String customerContact,
      String paymentGateway,
      String zip,
      String city,
      String state,
      String country,
      String streetAddress,
      BuildContext context
      )async{
      isVisable2.value=true;
      createOrderResponse.value=await repo.createOrder(
         productList,
         amount,
         salesTax,
         couponId,
         paidTotal,
         total,
         deliveryTime,
         customerContact,
         paymentGateway,
         zip,
         city,
         state,
         country,
         streetAddress,);
      isVisable2.value=false;
    if(resultCodeCreateOrder==201){
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, '/success_dialog_screen',ModalRoute.withName('/success_dialog_screen'),arguments: createOrderResponse.value);
    }else{
      Fluttertoast.showToast(
          msg: "error while creating order",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: MyColors.STATUSEREDColor
      );
    }
  }
}