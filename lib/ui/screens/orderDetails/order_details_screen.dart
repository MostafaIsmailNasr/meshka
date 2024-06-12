import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:observe_internet_connectivity/observe_internet_connectivity.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../business/orderController/OrderController.dart';
import '../../../conustant/my_colors.dart';
import '../../widget/CreatOrderProductItem.dart';
import '../shimer_pages/orderDetailsShim/order_details_shim.dart';

class OrderDetailsScreen extends StatefulWidget{
  String orderId;

  OrderDetailsScreen({required this.orderId});

  @override
  State<StatefulWidget> createState() {
    return _OrderDetailsScreen();
  }
}

class _OrderDetailsScreen extends State<OrderDetailsScreen>{
  final orderController = Get.put(OrderController());
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  var con=true;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      check();
      orderController.getOrdersDetails(widget.orderId);
    });
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
      body:con? Obx(() => !orderController.isLoading.value?
      Container(
        margin: EdgeInsetsDirectional.only(start: 2.h, end: 2.h, top: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              status(),
              SizedBox(height: 1.h,),
              dateAndOrderNumber(),
              SizedBox(height: 1.h,),
              paymentAndPrice(),
              SizedBox(height: 1.h,),
              details(),
              SizedBox(height: 1.h,),
              products(),
            ],
          ),
        ),
      )
          :OrderDetailsShim()):NoIntrnet(),
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
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  check();
                  orderController.getOrdersDetails(widget.orderId);
                });
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

  Widget status(){
    return Container(
      padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,top: 1.5.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:MyColors.MainTint5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("status".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark2)),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,top: 1.h,bottom: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: MyColors.MainColor, width: 1.0,),
                      color:MyColors.MainColor),
                  child: Text(orderController.orderDetailsResponse.value.orderStatus??"", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:Colors.white),textAlign: TextAlign.center,),
                ),
                SizedBox(height: 1.5.h,)
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("payment_status".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark2)),
                Container(
                  padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,top: 1.h,bottom: 1.h),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: MyColors.SecondryColor, width: 1.0,),
                      color:MyColors.SecondryColor),
                  child: Text(orderController.orderDetailsResponse.value.paymentStatus??"", style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:Colors.white),textAlign: TextAlign.center,),
                ),
                SizedBox(height: 1.5.h,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dateAndOrderNumber(){
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 10.h,
            padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MyColors.Dark5, width: 1.0,),
                color:MyColors.MainTint5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("date".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark3)),
                Text(orderController.orderDetailsResponse.value.createdAt??"", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ],
            ),
          ),
        ),
        SizedBox(width: 1.h,),
        Expanded(
          child: Container(
            height: 10.h,
            padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MyColors.Dark5, width: 1.0,),
                color:MyColors.MainTint5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("order_number".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark3)),
                Text("# ${orderController.orderDetailsResponse.value.trackingNumber}"??"", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget paymentAndPrice(){
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 10.h,
            padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MyColors.Dark5, width: 1.0,),
                color:MyColors.MainTint5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Method_of_payment".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark3)),
                Text(orderController.orderDetailsResponse.value.paymentGateway??"", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ],
            ),
          ),
        ),
        SizedBox(width: 1.h,),
        Expanded(
          child: Container(
            height: 10.h,
            padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: MyColors.Dark5, width: 1.0,),
                color:MyColors.MainTint5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("total_price".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark3)),
                Text("${orderController.orderDetailsResponse.value.total.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget details(){
    return Container(
      padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,top: 1.5.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:MyColors.MainTint5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("total_amount".tr(), style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'medium',
              fontWeight: FontWeight.w500,
              color:MyColors.Dark1)),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("subtotal".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              Text("${orderController.orderDetailsResponse.value.amount.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("tax".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              Text("${orderController.orderDetailsResponse.value.salesTax.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("shipping_fees".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              orderController.orderDetailsResponse.value.deliveryFee.toString()!="null"?
              Text("${orderController.orderDetailsResponse.value.deliveryFee.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1)):
              Text("${"0"} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("discount".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              orderController.orderDetailsResponse.value.discount.toString()!="null"?
              Text("${orderController.orderDetailsResponse.value.discount.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1)):
              Text("${"0"} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("total".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              Text("${orderController.orderDetailsResponse.value.total.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          SizedBox(height: 2.h,),
          SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
          SizedBox(height: 2.h,),
          Text("order_details".tr(), style:  TextStyle(fontSize: 14.sp,
              fontFamily: 'medium',
              fontWeight: FontWeight.w500,
              color:MyColors.Dark1)),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("total_items".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              Text("${orderController.productList.length.toString()??""} ${'item'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("delivery_time".tr(),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.Dark3)),
              Text(orderController.orderDetailsResponse.value.deliveryTime??"",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.Dark1))
            ],
          ),
          SizedBox(height: 1.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("delivery_address2".tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
              Text(orderController.orderDetailsResponse.value.shippingAddress?.streetAddress??"", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1))
            ],
          ),
          // SizedBox(height: 1.h,),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text("billing_address".tr(), style:  TextStyle(fontSize: 12.sp,
          //         fontFamily: 'regular',
          //         fontWeight: FontWeight.w400,
          //         color:MyColors.Dark3)),
          //     Text(orderController.orderDetailsResponse.value.billingAddress?.streetAddress??"", style:  TextStyle(fontSize: 12.sp,
          //         fontFamily: 'regular',
          //         fontWeight: FontWeight.w400,
          //         color:MyColors.Dark1))
          //   ],
          // ),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }

  Widget products(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:Colors.white),
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(1.5.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                border: Border.all(color: MyColors.MainTint4, width: 1.0,),
                color: MyColors.MainTint5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("product".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
                Text("subtotal".tr(), style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark1)),
              ],
            ),
          ),
          Container(
              padding: EdgeInsetsDirectional.all(1.5.h),
              child: productList())
        ],
      ),
    );
  }

  Widget productList(){
    if(orderController.productList.isNotEmpty) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: orderController.productList.length,
          itemBuilder: (context, int index) {
            return CreatOrderProductItem(
                products: orderController.productList[index]
            );
          }
      );
    }else{
      return Container();
    }
  }

}