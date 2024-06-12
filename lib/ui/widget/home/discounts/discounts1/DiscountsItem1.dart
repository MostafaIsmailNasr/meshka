import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';

class DiscountsItem1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: const AssetImage('assets/dis.png'),height: 25.h,width: 38.w,fit: BoxFit.fill,),
            Text("أساطير مقدسة", style:  TextStyle(fontSize: 12.sp,
                fontFamily: 'regular',
                fontWeight: FontWeight.w400,
                color:MyColors.MainColor),maxLines: 1,),
            // SizedBox(
            //   width: 45.w,
            //   child: Text("قصة الخلق، طبقات السماوات والأرض وسكانهم، حكاية إبليس...", style:  TextStyle(fontSize: 10.sp,
            //       fontFamily: 'light',
            //       fontWeight: FontWeight.w300,
            //       color:MyColors.MainTint1),maxLines: 2,),
            // ),
            Row(
              children: [
                Text("40QR", style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'heavy',
                    fontWeight: FontWeight.w700,
                    color:MyColors.MainColor)),
                SizedBox(width: 1.h,),
                Text("450QR", style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:MyColors.Dark4,
                    decoration: TextDecoration.lineThrough)),
              ],
            )
          ],
        ),
      ),
    );
  }

}