import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../conustant/my_colors.dart';

class EmptyScreen extends StatelessWidget{
  var image,tittle,des;

  EmptyScreen({required this.image,required this.tittle,required this.des});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 60),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(image),
              SizedBox(height: 1.h,),
              Text(tittle,
                style: TextStyle(fontSize: 16.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w500,
                    color: MyColors.Dark1),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h,),
              Text(des,
                style: TextStyle(fontSize: 14.sp,
                    fontFamily: 'bold',
                    fontWeight: FontWeight.w400,
                    color: MyColors.Dark3),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

}