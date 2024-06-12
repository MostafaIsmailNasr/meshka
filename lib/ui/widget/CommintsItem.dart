import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../conustant/my_colors.dart';

class CommintsItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 1.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.w,
                height: 5.h,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/proff.png',
                      //   loadingBuilder: (context, child,
                      //       loadingProgress) =>
                      //   (loadingProgress == null)
                      //       ? child
                      //       : Center(
                      //       child: CircularProgressIndicator()),
                      // ),
                    )
                ),
              ),
              SizedBox(width: 1.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("mahmoud", style:  TextStyle(fontSize: 14.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.Dark1)),
                      SizedBox(width: 1.h,),
                      Text("@mahmoudadel12", style:  TextStyle(fontSize: 10.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.Dark3)),
                      SizedBox(width: 1.h,),
                      Text(".16س", style:  TextStyle(fontSize: 10.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.Dark3)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('reply_to'.tr(), style:  TextStyle(fontSize: 12.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.Dark3)),
                      SizedBox(width: 1.h,),
                      Text("@mahmoudadel12", style:  TextStyle(fontSize: 10.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color:MyColors.SecondryColor)),
                    ],
                  ),
                  Text('كتاب جميل جدا', style:  TextStyle(fontSize: 14.sp,
                      fontFamily: 'regular',
                      fontWeight: FontWeight.w400,
                      color:MyColors.Dark1)),
                ],
              )
            ],
          ),
          SizedBox(height: 1.h,),
          SvgPicture.asset('assets/saperator.svg',width: MediaQuery.of(context).size.width,),
        ],
      ),
    );
  }

}