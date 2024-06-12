import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../conustant/my_colors.dart';
import '../../../data/model/listOrderModel/ListOrderResponse.dart';

class MyOrderItem extends StatelessWidget{
  final ButtonStyle flatButtonStyle2 = TextButton.styleFrom(
      backgroundColor: MyColors.MainTint5,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
  Orders? orders;

  MyOrderItem({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 1.h),
      padding: EdgeInsetsDirectional.all(1.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:Colors.white),
      child: Column(
        children: [
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'order_number'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark3)),
              Text(
                  "# ${orders!.trackingNumber}"??"", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark1)),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'date'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark3)),
              Text(
                  orders?.createdAt??"", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark1)),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'order_status'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark3)),
              Container(
                padding: EdgeInsetsDirectional.only(start: 2.h,end: 2.h,top: 1.h,bottom: 1.h),
                decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(color: MyColors.SecondryColor, width: 1.0,),
                    color:MyColors.SecondryColor),
                child: Text(
                    orders?.orderStatus??"", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'total_price'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark3)),
              Text(
                  "${orders?.total.toString()??""} ${'currency'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark1)),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'number_of_item'.tr(), style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark3)),
              Text(
                  "${orders?.products?.length.toString()??""} ${'item'.tr()}", style:  TextStyle(fontSize: 12.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color: MyColors.Dark1)),
            ],
          ),
          SizedBox(height: 1.h,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 7.h,
            child: TextButton(
              style: flatButtonStyle2 ,
              onPressed: (){
                Navigator.pushNamed(context, '/order_details_screen',arguments: orders?.trackingNumber!);
              },
              child: Text('order_details'.tr(),
                  style:  TextStyle(fontSize: 12.sp,
                      fontFamily: 'lexend_regular',
                      fontWeight: FontWeight.w400,
                      color: MyColors.MainColor)),
            ),
          ),
          SizedBox(height: 1.h,),
        ],
      ),
    );
  }

}