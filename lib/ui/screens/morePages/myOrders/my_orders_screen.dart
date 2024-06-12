import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/orderController/OrderController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../widget/order/MyOrderItem.dart';
import 'dart:math' as math;

import '../../shimer_pages/myOrdersShim/my_orders_shim.dart';
import '../../shimer_pages/ordersShim/OrdersShim.dart';

class MyOrdersScreeen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyOrdersScreeen();
  }
}

class _MyOrdersScreeen extends State<MyOrdersScreeen>{
  final orderController = Get.put(OrderController());
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  var con=true;

  @override
  void initState() {
    check();
    orderController.page=1;
    orderController.getOrders(orderController.page);
    orderController.scroll.addListener(orderController.scrollListener);
    super.initState();
  }

  Future<void> check()async{
    final hasInternet = await InternetConnectivity().hasInternetConnection;
    setState(() {
      con = hasInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Transform.rotate(
                angle:translator.activeLanguageCode=='en'? 180 *math.pi /180:0,
                child: SvgPicture.asset('assets/back.svg',))
        ),
        title: Center(
          child: SvgPicture.asset(
            'assets/logo_login.svg',
            height: 7.h,
          ),
        ),
      ),
      body: con? Obx(() => !orderController.isLoading.value?
      Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('my_orders'.tr(), style:  TextStyle(fontSize: 16.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w500,
                color: MyColors.MainColor),),
            SizedBox(height:1.h,),
            //myOrdersList(),
            Obx(() => !orderController.isLoading2.value
                ? Expanded(child: myOrdersList())
                : orderController.page == 1
                ? const Expanded(
                child: Center(
                    child: CircularProgressIndicator(
                      color: MyColors.MainColor,
                    )))
                : Expanded(child: myOrdersList())),
          ],
        ),
      )
          :MyOrdersShim()):NoIntrnet()
      //const Center(child: CircularProgressIndicator(color: MyColors.MainColor,))),
    );
  }

  Widget NoIntrnet(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/no_internet.svg'),
          //Image.asset('assets/no_internet.png'),
          SizedBox(height: 1.h,),
          Text('there_are_no_internet'.tr(),
            style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: MyColors.Dark1),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 1.h,),
          Container(
            width: double.infinity,
            height: 6.h,
            margin:  EdgeInsetsDirectional.only(start: 1.5.h, end: 1.5.h),
            child: TextButton(
              style: flatButtonStyle,
              onPressed: () async{
                check();
                orderController.page=1;
                orderController.getOrders(orderController.page);
                orderController.scroll.addListener(orderController.scrollListener);
              },
              child: Text('internet'.tr(),
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'lexend_bold',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
            ),
          ),
        ],
      ),

    );
  }

  Widget myOrdersList(){
    if(orderController.orderList.isNotEmpty){
      return ListView.builder(
          controller: orderController.scroll,
          scrollDirection: Axis.vertical,
          // physics: const ScrollPhysics(),
          // shrinkWrap: true,
          itemCount:orderController.orderList.length,
          itemBuilder: (context,int index){
            if (orderController.orderList[index].trackingNumber != "loading") {
              return MyOrderItem(orders: orderController.orderList[index]);
            }else{
              return const Center(child: CircularProgressIndicator(color: MyColors.MainColor),);
            }
          }
      );
    }else{
      return empty();
    }

  }

}

class empty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      //margin: EdgeInsets.only(top: 10.h),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset('assets/no_orders.svg'),
              SizedBox(height: 1.h,),
              Text('there_are_no_orders'.tr(),
                style: TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h,),
              Text('orders_will_appear_hear'.tr(),
                style: TextStyle(fontSize: 12.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark2),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}