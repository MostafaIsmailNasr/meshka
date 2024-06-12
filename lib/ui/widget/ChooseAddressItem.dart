
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sizer/sizer.dart';

import '../../conustant/my_colors.dart';
import '../../data/model/auth/UserDataModel/UserDataResponse.dart';

class ChooseAddressItem extends StatelessWidget{
  bool is_selected;
  GestureTapCallback? onTap;
  final Address address;
  ChooseAddressItem({required this.is_selected,required this.onTap,required this.address});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: MediaQuery.of(context).size.width,
        margin: EdgeInsetsDirectional.only(bottom: 1.h),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color:is_selected?MyColors.MainColor2: MyColors.Dark5, width: 2.0,),
            color: Colors.white),
        child: Padding(
          padding:  EdgeInsets.all(1.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.title??"",
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'medium',
                    fontWeight: FontWeight.w500,
                    color: MyColors.MainColor),
              ),
              SizedBox(height: 1.h,),
              Text(address.address?.streetAddress??"",
                style:  TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color: MyColors.MainTint1),
              ),
              SizedBox(height: 1.h,),
            ],
          ),
        ),
      ),
    );
  }


}