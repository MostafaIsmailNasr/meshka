
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../conustant/di.dart';
import '../../conustant/shared_preference_serv.dart';
import '../../data/model/listOrderModel/ListOrderResponse.dart';
import '../../data/model/orderDetailsModel/OrderDetailsResponse.dart';
import '../../data/reposatory/repo.dart';
import '../../data/web_service/WebService.dart';

class OrderController extends GetxController {
  Repo repo = Repo(WebService());
  var listOrderResponse = ListOrderResponse().obs;
  var orderDetailsResponse = OrderDetailsResponse().obs;
  var isLoading = false.obs;
  var isLoadingMore=false;
  var isLoading2=false.obs;
  var resultCodeOrders=0;
  var resultCodeOrdersDetails=0;
  RxList<dynamic> orderList=[].obs;
  RxList<dynamic> productList=[].obs;
  final SharedPreferencesService sharedPreferencesService =
  instance<SharedPreferencesService>();

  int page=1;
  final scroll=ScrollController();

  Future<void> scrollListener()async{
    if(isLoadingMore)return;
    if(scroll.position.pixels == scroll.position.maxScrollExtent){
      isLoadingMore=true;
      page=page+1;
      await getOrders(page);
      isLoadingMore=false;
    }
  }

  getOrders(int page) async {

    if(page==1){
      isLoading.value = true;
    }else{
      isLoading2.value = true;
    }

    Orders? loadingItem;

    if (listOrderResponse.value.currentPage != listOrderResponse.value.lastPage) {
      loadingItem = Orders(trackingNumber:  "loading");
      //isVisable.value=true;
      orderList.add(loadingItem!);
    }

    var response = await repo.getOrder(page);

    if (response != null) {
      //isVisable.value=false;
      listOrderResponse.value = response;
      List<Orders> newData = response.data ?? [];

      if (loadingItem != null) {
        orderList.remove(loadingItem);
      }

      if (page == 1) {
        orderList.assignAll(newData);
      } else {
        orderList.addAll(newData);
      }

      isLoading.value = false;
      isLoading2.value = false;
      return response;
    } else {
      isLoading.value = false;
      isLoading2.value = false;
      return response;
    }
  }

  getOrdersDetails(String orderId) async {
    isLoading.value = true;
    orderDetailsResponse.value = await repo.getOrderDetails(orderId);
    if (resultCodeOrdersDetails == 200) {
      productList.value = orderDetailsResponse.value.products ?? [];
      isLoading.value = false;
    }
    return orderDetailsResponse.value;
  }
}