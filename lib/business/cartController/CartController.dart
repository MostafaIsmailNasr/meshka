
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mashkah_library/data/model/cartModel/cartListModel/CartListResponse.dart';

import '../../conustant/di.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/cartModel/updateCartModel/UpdateCartResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';

class CartController extends GetxController {
  Repo repo = Repo(WebService());
  var updateCartResponse = UpdateCartResponse().obs;
  var cartListResponse = CartListResponse().obs;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var quantity=1.obs;
  var cartId="".obs;
  Rx<bool> isVisable = false.obs;
  Rx<bool> isVisable2 = false.obs;
  RxList<dynamic> cartList=[].obs;
  List<CartItems> cartItem = [];
  RxInt selectedItemIndex = RxInt(-1);
  RxInt subtotal = RxInt(0);
  RxDouble totalPrice1 = RxDouble(0.0);
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in cartList) {
      product.price.toString() != "null"
          ? totalPrice += (product.price) * (product.quantity ?? 0)
          : totalPrice += (0) * (product.quantity ?? 0);
    }
    print("jkhjhj" + totalPrice.toString());
    totalPrice1.value = totalPrice;
    return totalPrice;
  }

  getCart(String cartId)async{
    isLoading2.value=true;
    cartListResponse.value = await repo.getCartList(cartId);
    if(cartListResponse.value.success==true){
      isLoading2.value=false;
      cartList.value=cartListResponse.value.cartItem ??[];
      cartItem=cartListResponse.value.cartItem??[];
      totalPrice1.value=cartListResponse.value.totalAmount!.toDouble();
    }
    return cartListResponse.value;
  }



  updateCartQuantity(
      String sku,
      String cartId,
      int quantity,
      String productId)async{
    isLoading.value = true;
    updateCartResponse.value=await repo.updateCart(sku,quantity,cartId,productId);
  }

  deleteCartItem(String cartItemId,String productId,String cartId)async{
    updateCartResponse.value=await repo.deleteCartItem(productId,cartItemId);
  }

  deleteCart(String cartId,BuildContext context)async{
    //isLoading.value = true;
    updateCartResponse.value=await repo.deleteCart(cartId);
    if(updateCartResponse.value.success==true){
      await sharedPreferencesService.setString("cartId","null");
      Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
          ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);

      //isLoading.value = false;
      //getCart(cartId);
    }
  }
}