import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../conustant/my_colors.dart';
import '../../data/model/settingModel/SettingResponse.dart';

class DeliveryScheduleItem extends StatelessWidget{
  bool is_selected;
  GestureTapCallback? onTap;
  DeliveryTime? deliveryTime;

  DeliveryScheduleItem({required this.is_selected,required this.onTap,required this.deliveryTime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: 1.h),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsetsDirectional.only(top: 1.5.h,bottom: 1.5.h,start: 1.h,end: 1.h),
        decoration:is_selected? BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: MyColors.MainColor, width: 1.0,),
            color:Colors.white):
        BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: MyColors.Dark5, width: 1.0,),
            color:Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(deliveryTime?.title??"", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'medium',
                fontWeight: FontWeight.w500,
                color:MyColors.MainColor)),
            Text(deliveryTime?.description??"", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color:MyColors.MainTint1)),
          ],
        ),
      ),
    );
  }

}