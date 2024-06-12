import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../conustant/my_colors.dart';

class QuestionsFaqs extends StatelessWidget{
  bool is_selected;
  GestureTapCallback? onTap;
  //AllFaqs allFaqs;

  QuestionsFaqs({required this.is_selected,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: MyColors.Dark5,
              width: 1,
            ),
            color:is_selected? MyColors.MainColor:Colors.white
        ),
        child:  Padding(
          padding: EdgeInsets.all(5),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text("الطلبات",
                style: TextStyle(fontSize: 12.sp,
                    fontFamily: 'regular',
                    fontWeight: FontWeight.w400,
                    color:is_selected? Colors.white:MyColors.MainTint1),textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }

}