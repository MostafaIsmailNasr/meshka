import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../conustant/my_colors.dart';

class NotificationItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 1.5.h),
      padding: EdgeInsetsDirectional.all(1.5.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: MyColors.Dark5, width: 1.0,),
          color:Colors.white),
      child: Row(
        children: [
          SvgPicture.asset('assets/notification_icon.svg'),
          SizedBox(width: 1.h,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("متابعه الطلب", style:  TextStyle(fontSize: 14.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark1)),
              Text("تم تأكيد طلبك بنجاح سيتم التوصيل يوم 17 سبتمبر", style:  TextStyle(fontSize: 11.sp,
                  fontFamily: 'regular',
                  fontWeight: FontWeight.w400,
                  color:MyColors.Dark3)),
            ],
          )
        ],
      ),
    );
  }

}