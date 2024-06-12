import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

import '../../../../../conustant/my_colors.dart';


class SuccessUpdatePhoneDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SuccessUpdatePhoneDialog();
  }
}

class _SuccessUpdatePhoneDialog extends State<SuccessUpdatePhoneDialog>{
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: MyColors.MainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ));
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
                  'success'.tr(), style:  TextStyle(fontSize: 14.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.MainTint1),textAlign: TextAlign.center,),
                SizedBox(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.h,
                      child: Text(
                          'old'.tr(), style:  TextStyle(fontSize: 16.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: MyColors.MainTint2)),
                    ),
                    SizedBox(height: 1.h,),
                    Text(
                        "+974 854789562", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.MainColor)),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 25.h,
                      child: Text(
                          'new'.tr(), style:  TextStyle(fontSize: 16.sp,
                          fontFamily: 'regular',
                          fontWeight: FontWeight.w400,
                          color: MyColors.MainTint2)),
                    ),
                    Text(
                        "+974 854789478", style:  TextStyle(fontSize: 14.sp,
                        fontFamily: 'regular',
                        fontWeight: FontWeight.w400,
                        color: MyColors.MainColor)),
                  ],
                ),
                SizedBox(height: 1.5.h,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

}