import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../business/cartController/CartController.dart';
import '../../../../business/createOrderController/CreateOrderController.dart';
import '../../../../conustant/my_colors.dart';
import '../../../../data/model/createOrderModel/CreateOrderResponse.dart';


class SuccessDialogScreen extends StatefulWidget{
  CreateOrderResponse createOrderResponse;
  //var orderId;

  SuccessDialogScreen(this.createOrderResponse);

  @override
  State<StatefulWidget> createState() {
    return _SuccessDialogScreen();
  }
}

class _SuccessDialogScreen extends State<SuccessDialogScreen>{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
      backgroundColor: MyColors.SecondryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  final cartController = Get.put(CartController());
  final createOrderController = Get.put(CreateOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin:  EdgeInsetsDirectional.only(start: 2.h,end: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image.asset('assets/success2.png'),
                SvgPicture.asset('assets/success2.svg'),
                SizedBox(height: 1.h,),
                Text(
                    'congratulations'.tr(), style:  TextStyle(fontSize: 16.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w800,
                    color: MyColors.MainColor)),
                SizedBox(height: 1.h,),
                Text(
                  'your_order_has_been_confirmed_successfully'.tr(), style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.MainTint1),textAlign: TextAlign.center,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'subtotal'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark3)),
                    SizedBox(height: 1.h,),
                    Text(
                        "${cartController.totalPrice1.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'tax'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark3)),
                    Text(
                        "${createOrderController.tax.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'shipping_fees'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark3)),
                    Text(
                        "${createOrderController.fees.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'discount'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark3)),
                    Text(
                        "${createOrderController.discount.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        'total'.tr(), style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark3)),
                    Text(
                        "${createOrderController.totalPrice.value.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.Dark1)),
                  ],
                ),
                SizedBox(height: 1.h,),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 7.h,
                        child: TextButton(
                          style: flatButtonStyle ,
                          onPressed: (){
                            Navigator.pushNamedAndRemoveUntil(context,'/buttom_navagation_screen',
                                ModalRoute.withName('/buttom_navagation_screen'),arguments: 0);
                          },
                          child: Text('home'.tr(),
                              style:  TextStyle(fontSize: 12.sp,
                                  fontFamily: 'lexend_regular',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(width: 1.h,),
                    Expanded(
                      child: SizedBox(
                        height: 7.h,
                        child: TextButton(
                          style: flatButtonStyle2 ,
                          onPressed: (){
                            Navigator.pushNamed(context, '/order_details_screen',arguments: widget.createOrderResponse.trackingNumber);
                          },
                          child: Text('order_tracking'.tr(),
                              style:  TextStyle(fontSize: 12.sp,
                                  fontFamily: 'lexend_regular',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}